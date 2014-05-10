var MyDatatable = function( sTable ) {
	var ths = $(sTable + " > thead > tr > th").each(function(index) {
		// skip index 0
		if (index == 0 || index == 1)
			return;

		var oldText = $(this).text();
		var newText = '<div style="position:absolute;top:-225px;"><svg version="1.1" width="200px" height="200px"><text fill="#000000" stroke="none" font-size="100%" font="serif" transform="rotate(-45,5,185)"><tspan x="5" y="200">'
                +
                oldText
                + '</tspan></text></svg></div>';
		$(this).html(newText);
	});

	// wrap table inside div
	$(sTable).wrap("<div style='padding-top:185px;'></div>");
}