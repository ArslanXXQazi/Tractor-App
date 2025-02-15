

class MainModel
{
  String? customar_name;
  String? time;
  String? price;
  String? total_price;
  int?  id;
  String? date;
  String description;
  MainModel({
  required this.customar_name,
  required this.time,
  required this.price,
  required this.total_price,
  this.id,
  this.date,
  required this.description,
});

}