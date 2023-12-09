import '../models/word.dart';

//TODO insert below data into an SQLite database instead

final List<Word> words = [



  Word (topic: "Software",chapter: "Chapter",pinyin: "QUESTION",character: "lol"),






  Word(topic: "Beach",chapter: "Computer", pinyin: "Yóu Yǒng Yī", character: "游泳衣"),
  Word(topic: "Beach", chapter: "Seashell", pinyin: "Bèi Ké", character: "贝壳"),
  Word(topic: "Beach", chapter: "Sunscreen", pinyin: "Fáng Shài Shuāng", character: "防晒霜"),
  Word(topic: "Beach", chapter: "Surfboard", pinyin: "Chōng Làng Bǎn", character: "冲浪板"),

  Word(topic: "Birds", chapter: "Kiwi", pinyin: "Qí Yì Niǎo", character: "奇异鸟"),
  Word(topic: "Birds", chapter: "Duck", pinyin: "Yā Zi", character: "鸭子"),
  Word(topic: "Birds", chapter: "Flamingo", pinyin: "Huǒ Liè Niǎo", character: "火烈鸟"),

  Word(topic: "Body", chapter: "Nose", pinyin: "Bí Zi", character: "鼻子"),
  Word(topic: "Body", chapter: "Eye", pinyin: "Yǎn Jīng", character: "眼睛"),
  Word(topic: "Body", chapter: "Mouth", pinyin: "Zuǐ Ba", character: "嘴巴"),
  Word(topic: "Body", chapter: "Ear", pinyin: "Ěr Duo", character: "耳朵"),

  Word(topic: "City", chapter: "Hospital", pinyin: "Yī Yuàn", character: "医院"),
  Word(topic: "City", chapter: "Fire Station", pinyin: "Xiāo Fáng jú", character: "消防局"),
  Word(topic: "City", chapter: "Bank", pinyin: "Yín Háng", character: "银行"),

  Word(topic: "Dessert", chapter: "Ice Cream", pinyin: "Bīng Qín Lín", character: "冰淇淋"),
  Word(topic: "Dessert", chapter: "Chocolate", pinyin: "Qiǎo Kè Lì", character: "巧克力"),
  Word(topic: "Dessert", chapter: "Donut", pinyin: "Tián Tián Quān", character: "甜甜圈"),

  Word(topic: "Drinks", chapter: "Juice", pinyin: "Guǒ Zhī", character: "果汁"),
  Word(topic: "Drinks", chapter: "Beer", pinyin: "Pí Jiǔ", character: "啤酒"),
  Word(topic: "Drinks", chapter: "Milk", pinyin: "Niú Nǎi", character: "牛奶"),

  Word(topic: "Fruit", chapter: "Apple", pinyin: "Píng Guǒ", character: "苹果"),
  Word(topic: "Fruit", chapter: "Orange", pinyin: "Jú Zi", character: "橘子"),
  Word(topic: "Fruit", chapter: "Banana", pinyin: "Xiāng Jiāo", character: "香蕉"),

  Word(topic: "Insects", chapter: "Grasshopper", pinyin: "Zhà Měng", character: "蚱蜢"),
  Word(topic: "Insects", chapter: "Fly", pinyin: "Cāng Yíng", character: "苍蝇"),
  Word(topic: "Insects", chapter: "Spider", pinyin: "Zhī Zhū", character: "蜘蛛"),

  Word(topic: "Jobs", chapter: "Police Officer", pinyin: "Jǐng Chá", character: "警察"),
  Word(topic: "Jobs", chapter: "Construction Worker", pinyin: "Jiàn Zhú Gōng Rén", character: "建筑工人"),
  Word(topic: "Jobs", chapter: "Detective", pinyin: "Zhēn Tàn", character: "侦探"),

  Word(topic: "Land Animals", chapter: "Tiger", pinyin: "Lǎo Hǔ", character: "老虎"),
  Word(topic: "Land Animals", chapter: "Bear", pinyin: "Xióng", character: "熊"),
  Word(topic: "Land Animals", chapter: "Beaver", pinyin: "Hǎi Lí", character: "海狸"),
  Word(topic: "Land Animals", chapter: "Camel", pinyin: "Luò Tuó", character: "骆驼"),
  Word(topic: "Land Animals", chapter: "Dog", pinyin: "Gǒu", character: "狗"),

  Word(topic: "Marine Life", chapter: "Dolphin", pinyin: "Hǎi Tún", character: "海豚"),
  Word(topic: "Marine Life", chapter: "Shark", pinyin: "Shā Yú", character: "鲨鱼"),
  Word(topic: "Marine Life", chapter: "Whale", pinyin: "Jīng Yú", character: "鲸鱼"),

  Word(topic: "Music", chapter: "Piano", pinyin: "Gāng Qín", character: "钢琴"),
  Word(topic: "Music", chapter: "Flute", pinyin: "Cháng Dí", character: "长笛"),

  Word(topic: "Nature", chapter: "Tree", pinyin: "Shù", character: "树"),
  Word(topic: "Nature", chapter: "Rock", pinyin: "Shí Tou", character: "石头"),

  Word(topic: "School", chapter: "School Bag", pinyin: "Shū Bāo", character: "书包"),
  Word(topic: "School", chapter: "Computer", pinyin: "Diànnǎo", character: "电脑"),
  Word(topic: "School", chapter: "Pen", pinyin: "Bǐ", character: "笔"),

  Word(topic: "Shapes", chapter: "Triangle", pinyin: "Sān Jiǎo Xíng", character: "三角形"),
  Word(topic: "Shapes", chapter: "Circle", pinyin: "Yuán Xíng", character: "圆形"),
  Word(topic: "Shapes", chapter: "Square", pinyin: "Zhèng Fāng Xíng", character: "正方形"),

  Word(topic: "Sports", chapter: "Tennis", pinyin: "Wǎng Qiú", character: "网球"),
  Word(topic: "Sports", chapter: "Rugby", pinyin: "Gǎn Lǎn Qiú", character: "橄榄球"),
  Word(topic: "Sports", chapter: "Golf", pinyin: "Gāo'ěr Fū", character: "高尔夫"),

  Word(topic: "Vehicles", chapter: "Motorbike", pinyin: "Mó Tuō Chē", character: "摩托车"),
  Word(topic: "Vehicles", chapter: "Train", pinyin: "Huǒ Chē", character: "火车"),
  Word(topic: "Vehicles", chapter: "Truck", pinyin: "Kǎ Chē", character: "卡车"),
  Word(topic: "Vehicles", chapter: "Airplane", pinyin: "Fēi Jī", character: "飞机"),

  Word(topic: "Weather", chapter: "Rain", pinyin: "Xià Yǔ", character: "下雨"),
  Word(topic: "Weather", chapter: "Sun", pinyin: "Tài Yáng", character: "太阳"),
  Word(topic: "Weather", chapter: "Cloud", pinyin: "Yún", character: "云"),

];