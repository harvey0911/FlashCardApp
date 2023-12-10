import '../models/word.dart';

//TODO insert below data into an SQLite database instead

final List<Word> words = [



  Word (topic: "Software",chapter: "Chapter",pinyin: "QUESTION",question: "actual question"),

  Word(topic: "Software",chapter: "Computer", pinyin: "pinyin question", question: "actual question"),
  Word(topic: "Software", chapter: "Seashell", pinyin: "pinyin question", question: "actual question"),
  Word(topic: "Software", chapter: "Sunscreen", pinyin: "pinyin question", question: "actual question"),
  Word(topic: "Software", chapter: "Surfboard", pinyin: "pinyin question", question: "actual question"),

  Word(topic: "Birds", chapter: "Kiwi", pinyin: "Qí Yì Niǎo", question: "奇异鸟"),
  Word(topic: "Birds", chapter: "Duck", pinyin: "Yā Zi", question: "鸭子"),
  Word(topic: "Birds", chapter: "Flamingo", pinyin: "Huǒ Liè Niǎo", question: "火烈鸟"),

  Word(topic: "Body", chapter: "Nose", pinyin: "Bí Zi", question: "鼻子"),
  Word(topic: "Body", chapter: "Eye", pinyin: "Yǎn Jīng", question: "眼睛"),
  Word(topic: "Body", chapter: "Mouth", pinyin: "Zuǐ Ba", question: "嘴巴"),
  Word(topic: "Body", chapter: "Ear", pinyin: "Ěr Duo", question: "耳朵"),

  Word(topic: "City", chapter: "Hospital", pinyin: "Yī Yuàn", question: "医院"),
  Word(topic: "City", chapter: "Fire Station", pinyin: "Xiāo Fáng jú", question: "消防局"),
  Word(topic: "City", chapter: "Bank", pinyin: "Yín Háng", question: "银行"),

  Word(topic: "Dessert", chapter: "Ice Cream", pinyin: "Bīng Qín Lín", question: "冰淇淋"),
  Word(topic: "Dessert", chapter: "Chocolate", pinyin: "Qiǎo Kè Lì", question: "巧克力"),
  Word(topic: "Dessert", chapter: "Donut", pinyin: "Tián Tián Quān", question: "甜甜圈"),

  Word(topic: "Drinks", chapter: "Juice", pinyin: "Guǒ Zhī", question: "果汁"),
  Word(topic: "Drinks", chapter: "Beer", pinyin: "Pí Jiǔ", question: "啤酒"),
  Word(topic: "Drinks", chapter: "Milk", pinyin: "Niú Nǎi", question: "牛奶"),

  Word(topic: "Fruit", chapter: "Apple", pinyin: "Píng Guǒ", question: "苹果"),
  Word(topic: "Fruit", chapter: "Orange", pinyin: "Jú Zi", question: "橘子"),
  Word(topic: "Fruit", chapter: "Banana", pinyin: "Xiāng Jiāo", question: "香蕉"),

  Word(topic: "Insects", chapter: "Grasshopper", pinyin: "Zhà Měng", question: "蚱蜢"),
  Word(topic: "Insects", chapter: "Fly", pinyin: "Cāng Yíng", question: "苍蝇"),
  Word(topic: "Insects", chapter: "Spider", pinyin: "Zhī Zhū", question: "蜘蛛"),

  Word(topic: "Jobs", chapter: "Police Officer", pinyin: "Jǐng Chá", question: "警察"),
  Word(topic: "Jobs", chapter: "Construction Worker", pinyin: "Jiàn Zhú Gōng Rén", question: "建筑工人"),
  Word(topic: "Jobs", chapter: "Detective", pinyin: "Zhēn Tàn", question: "侦探"),

  Word(topic: "Land Animals", chapter: "Tiger", pinyin: "Lǎo Hǔ", question: "老虎"),
  Word(topic: "Land Animals", chapter: "Bear", pinyin: "Xióng", question: "熊"),
  Word(topic: "Land Animals", chapter: "Beaver", pinyin: "Hǎi Lí", question: "海狸"),
  Word(topic: "Land Animals", chapter: "Camel", pinyin: "Luò Tuó", question: "骆驼"),
  Word(topic: "Land Animals", chapter: "Dog", pinyin: "Gǒu", question: "狗"),

  Word(topic: "Marine Life", chapter: "Dolphin", pinyin: "Hǎi Tún", question: "海豚"),
  Word(topic: "Marine Life", chapter: "Shark", pinyin: "Shā Yú", question: "鲨鱼"),
  Word(topic: "Marine Life", chapter: "Whale", pinyin: "Jīng Yú", question: "鲸鱼"),

  Word(topic: "Music", chapter: "Piano", pinyin: "Gāng Qín", question: "钢琴"),
  Word(topic: "Music", chapter: "Flute", pinyin: "Cháng Dí", question: "长笛"),

  Word(topic: "Nature", chapter: "Tree", pinyin: "Shù", question: "树"),
  Word(topic: "Nature", chapter: "Rock", pinyin: "Shí Tou", question: "石头"),

  Word(topic: "School", chapter: "School Bag", pinyin: "Shū Bāo", question: "书包"),
  Word(topic: "School", chapter: "Computer", pinyin: "Diànnǎo", question: "电脑"),
  Word(topic: "School", chapter: "Pen", pinyin: "Bǐ", question: "笔"),

  Word(topic: "Shapes", chapter: "Triangle", pinyin: "Sān Jiǎo Xíng", question: "三角形"),
  Word(topic: "Shapes", chapter: "Circle", pinyin: "Yuán Xíng", question: "圆形"),
  Word(topic: "Shapes", chapter: "Square", pinyin: "Zhèng Fāng Xíng", question: "正方形"),

  Word(topic: "Sports", chapter: "Tennis", pinyin: "Wǎng Qiú", question: "网球"),
  Word(topic: "Sports", chapter: "Rugby", pinyin: "Gǎn Lǎn Qiú", question: "橄榄球"),
  Word(topic: "Sports", chapter: "Golf", pinyin: "Gāo'ěr Fū", question: "高尔夫"),

  Word(topic: "Vehicles", chapter: "Motorbike", pinyin: "Mó Tuō Chē", question: "摩托车"),
  Word(topic: "Vehicles", chapter: "Train", pinyin: "Huǒ Chē", question: "火车"),
  Word(topic: "Vehicles", chapter: "Truck", pinyin: "Kǎ Chē", question: "卡车"),
  Word(topic: "Vehicles", chapter: "Airplane", pinyin: "Fēi Jī", question: "飞机"),

  Word(topic: "Weather", chapter: "Rain", pinyin: "Xià Yǔ", question: "下雨"),
  Word(topic: "Weather", chapter: "Sun", pinyin: "Tài Yáng", question: "太阳"),
  Word(topic: "Weather", chapter: "Cloud", pinyin: "Yún", question: "云"),

];