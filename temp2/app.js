		let visibleRanges = editor.visibleRanges;
		// first, we get the invisible ranges of the editor
		let invisibleRanges: vscode.Range[] = [];

		let lastEndLine = 0;
		for (const visibleRange of visibleRanges) {
			invisibleRanges.push(new vscode.Range(lastEndLine, 0, visibleRange.start.line, 0));
			lastEndLine = visibleRange.end.line;
		}
		invisibleRanges.push(new vscode.Range(lastEndLine, 0, document.lineCount, 0));

		// now, we filter out the ranges that are inside the invisible ranges of the editor
		rangesToFold = rangesToFold.filter(range => {
			for (const invisibleRange of invisibleRanges) {
				if (invisibleRange.start.line <= range.startLine && range.endLine < invisibleRange.end.line) {
					return false;
				}
			}
			return true;
		});