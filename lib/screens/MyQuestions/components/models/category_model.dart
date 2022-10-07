import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String lessonName;
  final String imageUrl;

  const Category({
     this.lessonName,
     this.imageUrl,
});


  @override
  // TODO: implement props
  List<Object> get props => [lessonName,imageUrl];
static List<Category> categories = [
  Category(
    lessonName: 'Matematik',
    imageUrl: 'https://www.yonkursmerkezi.com/image/egitimler/matematik-dersi.jpg',
  ),
  Category(
    lessonName: 'Matematik-2',
    imageUrl: 'https://www.yonkursmerkezi.com/image/egitimler/matematik-dersi.jpg',
  ),
  Category(
      lessonName: 'Fizik-2',
      imageUrl: 'https://image.shutterstock.com/image-vector/physics-education-concept-icons-formulas-260nw-1702863208.jpg',
  ),
  Category(
    lessonName: 'Fizik-1',
    imageUrl: 'https://image.shutterstock.com/image-vector/physics-education-concept-icons-formulas-260nw-1702863208.jpg',
  ),
  Category(
      lessonName: 'Kimya-2',
      imageUrl: 'https://media.istockphoto.com/photos/yellow-chemical-liquid-containing-in-flask-with-lab-glassware-on-la-picture-id1205630093?k=20&m=1205630093&s=612x612&w=0&h=k7UMmu5wsruo4cedr7OtZbdS0CunW4SP30IeGSVXdUg=',
  ),
];

}