macro_rules! code_fmt {
	() => (r#"macro_rules! code_fmt {{{0}	() => (r#{1}{2}{1}#){0}}}{0}{0}macro_rules! child {{{0}	() => ({1}Grace_kid.rs{1});{0}}}{0}{0}//{0}// This is a comment.{0}//{0}macro_rules! main {{{0}	() => {{{0}		fn main() -> std::io::Result<()> {{{0}			std::fs::write(child!(), &format!(code_fmt!(), {1}\n{1}, r#{1}{1}{1}#, code_fmt!())){0}		}}{0}	}};{0}}}{0}{0}main!();{0}"#)
}

macro_rules! child {
	() => ("Grace_kid.rs");
}

//
// This is a comment.
//
macro_rules! main {
	() => {
		fn main() -> std::io::Result<()> {
			std::fs::write(child!(), &format!(code_fmt!(), "\n", r#"""#, code_fmt!()))
		}
	};
}

main!();
