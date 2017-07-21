# Dynamic tableHeaderView bug on iOS 9

When you dynamically change the frame of a `tableHeaderView` in iOS 9, the table view is not automatically resized. Because of this bug, the first cells of the table view might not be visible [see second screenshots].

To avoid the bug, when you update the frame of the `tableHeaderView` you also have to update the reference of the table view's `tableHeaderView`.

This project shows the bug and a possible solution.

### Before changing the header view

![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableheaderview.png)

### After updating the frame of tableHeaderView (buggy)
![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableheaderview-bug.png)

### After updating the frame of tableHeaderView (fixed)

![](https://github.com/andreacipriani/tableview-headerview/blob/master/images/tableheaderview-bug-fixed.png)

