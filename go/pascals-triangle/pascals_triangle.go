package pascal

// Triangle computes Pascal's triangle up to a given number of rows
func Triangle(n int) (triangle [][]int) {
	if n < 1 {
		return
	}

	triangle = append(triangle, []int{1})

	for i := 2; i <= n; i++ {
		last := triangle[len(triangle)-1]
		lastLen := len(last)

		row := make([]int, lastLen+1)

		row[0] = last[0]

		for j := 0; j < lastLen-1; j++ {
			row[j+1] = last[j] + last[j+1]
		}

		row[len(row)-1] = last[lastLen-1]

		triangle = append(triangle, row)
	}

	return
}
