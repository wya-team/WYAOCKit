- (BOOL)searchBarShouldBeginEditing:
    (UISearchBar *)searchBar;                                  // return NO to not become first responder
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar; // called when text starts editing
- (BOOL)searchBarShouldEndEditing:
    (UISearchBar *)searchBar;                                // return NO to not resign first responder
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar; // called when text ends editing
- (void)searchBar:(UISearchBar *)searchBar
    textDidChange:(NSString *)searchText; // called when text changes (including clear)
- (BOOL)searchBar:(UISearchBar *)searchBar
    shouldChangeTextInRange:(NSRange)range
            replacementText:(NSString *)text NS_AVAILABLE_IOS(3_0); // called before text changes

- (void)searchBarSearchButtonClicked:
    (UISearchBar *)searchBar; // called when keyboard search button pressed
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
    __TVOS_PROHIBITED; // called when bookmark button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
    __TVOS_PROHIBITED; // called when cancel button pressed
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar
    NS_AVAILABLE_IOS(3_2)__TVOS_PROHIBITED; // called when search results button pressed

- (void)searchBar:(UISearchBar *)searchBar
    selectedScopeButtonIndexDidChange:(NSInteger)selectedScope NS_AVAILABLE_IOS(3_0);
