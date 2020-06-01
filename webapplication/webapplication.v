module main

import vweb

pub struct Vib{
pub mut:
	vweb vweb.Context
}

fn main() {
	vweb.run<Vib>(8080)
}

fn (mut vib Vib) index() {
	vib.vweb.text('Hello world from vweb!')
}

pub fn (vlib Vib) init() {}
pub fn (vlib Vib) reset() {}