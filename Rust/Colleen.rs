macro_rules! code_fmt {
	() => (r#"macro_rules! code_fmt {{{0}	() => (r#{1}{2}{1}#){0}}}{0}{0}fn print_code() {{{0}	print!(code_fmt!(), {1}\n{1}, r#{1}{1}{1}#, code_fmt!());{0}}}{0}//{0}// This is a comment.{0}//{0}{0}fn main() {{{0}	//{0}	// And this is another comment.{0}	//{0}	print_code();{0}}}{0}"#)
}

fn print_code() {
	print!(code_fmt!(), "\n", r#"""#, code_fmt!());
}
//
// This is a comment.
//

fn main() {
	//
	// And this is another comment.
	//
	print_code();
}
