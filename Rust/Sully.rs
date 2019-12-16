use std::{ process::Command, fs::write };

macro_rules! code_fmt {
	() => (r#"use std::{{ process::Command, fs::write }};{0}{0}macro_rules! code_fmt {{{0}	() => (r#{1}{2}{1}#){0}}}{0}{0}fn main() -> std::io::Result<()> {{{0}	let mut i: i64 = {3};{0}	if file!() != {1}Sully.rs{1} {{{0}		if i <= 0 {{ return Ok(()) }}{0}		i -= 1;{0}	}}{0}	let file_name = format!({1}Sully_{{}}.rs{1}, i);{0}	let len = file_name.len();{0}	write(&file_name, &format!(code_fmt!(), {1}\n{1}, r#{1}{1}{1}#, code_fmt!(), i))?;{0}	Command::new({1}rustc{1}).args(&[file_name.clone(), {1}-o{1}.into(), file_name[..len - 3].into()]).status()?;{0}	Command::new({1}./{1}.to_owned() + &file_name[..len - 3]).spawn()?;{0}	Ok(()){0}}}{0}"#)
}

fn main() -> std::io::Result<()> {
	let mut i: i64 = 5;
	if file!() != "Sully.rs" {
		if i <= 0 { return Ok(()) }
		i -= 1;
	}
	let file_name = format!("Sully_{}.rs", i);
	let len = file_name.len();
	write(&file_name, &format!(code_fmt!(), "\n", r#"""#, code_fmt!(), i))?;
	Command::new("rustc").args(&[file_name.clone(), "-o".into(), file_name[..len - 3].into()]).status()?;
	Command::new("./".to_owned() + &file_name[..len - 3]).spawn()?;
	Ok(())
}
