module main

import vweb

pub struct Vib{
mut:
	vweb vweb.Context
}

fn main() {
	vweb.run<Vib>(8080)
}

fn (vib mut Vib) index() {
	app.vweb.text('Hello world from vweb!')
}

pub fn (vlib &App) init() {}
pub fn (vlib &App) reset() {}