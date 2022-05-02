String formatDate ( DateTime date ) {
  return date
      .toString()
      .split(" ")[0]
      .replaceAll("-", "/")
      .split("/")
      .reversed
      .join("/");
}