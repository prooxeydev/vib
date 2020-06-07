module main

import vweb
import vweb.assets
import os

const (
	port = 8082
)

struct Vib {
pub mut:
	vweb vweb.Context
	static_css []byte
	static_js []byte
}

fn main() {
	vweb.run<Vib>(port)
}

pub fn (mut app Vib) index() {
	mut site_css := get_css('./assets/userpage.css')
	site_css << app.static_css
	css := string(site_css)
	$vweb.html()
}

pub fn (mut app Vib) init() {
	static_css := get_css('./assets/footer.css', './assets/header.css', './assets/main.css')
	app.static_css = static_css
}

pub fn (mut app Vib) reset() {

}

fn get_css(css ...string) []byte {
	mut d_css := []byte{}
	for file in css {
		data := os.read_file(file) or { '' }
		d_css << assets.minify_css(data).bytes()
	}
	return d_css
}