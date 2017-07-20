# Dynamic tableHeaderView bug on iOS 9

There is a bug in iOS 9 that happens when you dynamically change the frame of a `tableHeaderView`.
When you do that, the table view frame is not correctly resized unless you update the reference of the `tableHeaderView`.
As you can see in the second screenshot, some cells of table view are covered by the header.

This project shows the bug and a possible solution.

### Before changing the header view

![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableview-header.png)

### After updating the frame of tableHeaderView (buggy)
![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableview-header-resized-bugged.png)

### After updating the frame of tableHeaderView (fixed)

![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableview-header-resized-fixed.png)

