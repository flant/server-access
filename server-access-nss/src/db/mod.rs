use anyhow::Result;
use libnss::interop::Response;

pub const DEFAULT_PATH: &str = "/opt/serveraccessd/server-accessd.db";

lazy_static! {
    pub static ref PATH: String = if cfg!(feature = "dynamic_paths") {
        std::env::var("NSS_FLANTAUTH_PASSWD_PATH").unwrap_or_else(|_| String::from(DEFAULT_PATH))
    } else {
        String::from(DEFAULT_PATH)
    };
}

pub fn from_result<T>(res: Result<T>) -> Response<T> {
    res.map(Response::Success)
        .unwrap_or_else(|err| match err.downcast::<rusqlite::Error>() {
            Ok(rusqlite::Error::QueryReturnedNoRows) => Response::NotFound,
            _ => Response::Unavail,
        })
}