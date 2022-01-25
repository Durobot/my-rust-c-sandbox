//use libc::size_t;

#[link(name = "c-lib")]
extern
{
    fn add(a: i32, b: i32) -> i32;
}

fn main()
{
    let x = unsafe { add(5, 3) };
    println!("Result from c-lib = {}", x);
}