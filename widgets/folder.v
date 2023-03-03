module widgets

import ui

pub enum FolderType {
	all
	custom
}

pub struct FolderParams {
	typ       FolderType
	name      string
	icon_size int
}

pub fn new_folder(params FolderParams) ui.Widget {
	return ui.row(
		heights: [48.0]
		widths: [ui.stretch]
		children: [
			ui.row(
				margin: ui.Margin{
					left: 12.0
				}
				children: [
					ui.picture(
						height: params.icon_size
						width: params.icon_size
						path: params.typ.to_image_path()
					),
				]
			),
		]
	)
}

fn (f FolderType) to_image_path() string {
	// Folder icons are non-transparent because I didn't find them.
	if f == .custom {
		return 'assets/folders_custom.png'
	} else {
		return 'assets/folders_all.png'
	}
}
