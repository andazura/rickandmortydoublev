int? getIdUrl(String url) {
  if (!url.contains("/")) return null;
  return int.parse(url.split("/").last);
}
