# TableView dynamic Header View bug on iOS 9

There is a bug in iOS 9 that happens when you dynamically change the frame of a table view header.
The table view frame is not correctly resized unless you set a new reference. As you can see in the second screenshot, some cells of table view are covered by the header.

This project shows the bug and a possible solution.

[images/tableview-header]


