class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        count = 0
        rows = len(grid)
        columns = len(grid[0])
        
        def isValid(r, c) -> bool:
            return r >= 0 and r < rows and c >= 0 and c < columns and grid[r][c] == "1"

        def dfs(r, c):
            if not isValid(r, c):
                return
            grid[r][c] = "2"

            dfs(r - 1, c)
            dfs(r, c + 1)
            dfs(r + 1, c)
            dfs(r, c - 1)

        for r in range(rows):
            for c in range(columns):
                if grid[r][c] == "1":
                    count += 1
                    dfs(r, c)

        return count