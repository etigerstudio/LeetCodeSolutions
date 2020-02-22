// Binary test
int firstBadVersion(int n) {
    int low = 1;
    int high = n;
    while (high > low) {
        int mid = low + (high - low) / 2;
        if (isBadVersion(mid)) {
            high = mid;
        } else {
            low = mid + 1;
        }
    }
    
    return high;
}