class Structures {
  class Desktop {
    stacked(number, windows) {
      return { is: "desktop", number: number, mode: "stacked", windows: windows }
    }
    tiled(number, tree) {
      return { is: "desktop", number: number, mode: "tiled", tree: tree }
    }
  }

  tree(split, ratio, alpha, omega) {
    return { is: "tree", split: split, ratio: ratio, alpha: alpha, omega: omega }
  }

  empty() {
    return { is: "empty" }
  }

  window(id) {
    return { is: "window", id: id }
  }
}
