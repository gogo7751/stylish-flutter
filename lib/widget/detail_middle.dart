import 'package:flutter/material.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/text_style.dart';
import 'package:stylish/widget/button_style.dart';
import 'package:stylish/page/detail_page.dart';
import 'package:stylish/page/home_page.dart';

class DeatilMiddle extends StatefulWidget {
  const DeatilMiddle({
    Key? key,
    required this.productDetail,
    required this.widget,
  }) : super(key: key);

  final Product productDetail;
  final DetailPage widget;

  @override
  _DeatilMiddleState createState() => _DeatilMiddleState();
}

class _DeatilMiddleState extends State<DeatilMiddle> {
  int _count = 1;
  int _sizeIndex = 0;
  int _colorIndex = 0;
  int _stock = 0;

  void _showAlertDialog(String title, String content, VoidCallback onPressed) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                onPressed();
              },
              child: const Text("關閉"),
            ),
          ],
        );
      },
    );
  }

  void _handleCount(bool isAdd) {
    setState(() {
      isAdd
          ? _count < _stock
              ? _count++
              : _showAlertDialog("提示", "庫存已達上限", () => Navigator.pop(context))
          : _count > 1
              ? _count--
              : _count = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _stock = widget.productDetail.variants[0].stock;
  }

  void _handleSize(int index, int stock) {
    setState(() {
      _sizeIndex = index;
      _stock = stock;
      _count = 1;
    });
  }

  void _handleColor(int index) {
    setState(() {
      _colorIndex = index;
      _sizeIndex = 0;
      _count = 1;
    });
  }

  void _handleConfirmButton() {
    if (_sizeIndex == -1 || _colorIndex == -1) {
      _showAlertDialog("提示", _colorIndex > -1 ? "請選擇尺寸" : "請選擇顏色",
          () => Navigator.pop(context));
      return;
    }

    _showAlertDialog(
      "成功",
      "已加入購物車",
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextWithStyle(
        text: widget.productDetail.title,
        marginTop: 16,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      TextWithStyle(
        text: (widget.productDetail.id).toString(),
        color: const Color.fromARGB(141, 48, 48, 48),
      ),
      TextWithStyle(
        text: "NT\$ ${widget.productDetail.price}",
        marginTop: 16,
        marginBottom: 16,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextWithStyle(text: "顏色"),
          const SizedBox(width: 20),
          SizedBox(
            height: 20,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.productDetail.variants.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 15),
                    child: ButtonWithStyle(
                      text: "",
                      backgroundColor: Color(int.parse(
                          "0xFF${widget.productDetail.variants[index].colorCode}")),
                      isCurcleshape: false,
                      borderColor: _colorIndex == index
                          ? Colors.black
                          : Colors.transparent,
                      borderWidth: _colorIndex == index ? 2 : 0,
                      onPressed: () {
                        _handleColor(index);
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
      const SizedBox(height: 18),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextWithStyle(text: "尺寸"),
          const SizedBox(width: 20),
          SizedBox(
            height: 20,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.productDetail.sizes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      width: 50,
                      margin: const EdgeInsets.only(right: 15),
                      child: ButtonWithStyle(
                        text: widget.productDetail.sizes[index],
                        backgroundColor:
                            _sizeIndex == index ? Colors.grey : Colors.white,
                        foregroundColor:
                            _sizeIndex == index ? Colors.white : Colors.black,
                        onPressed: () {
                          _handleSize(index,
                              widget.productDetail.variants[index].stock);
                        },
                      ));
                }),
          ),
        ],
      ),
      const SizedBox(height: 18),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TextWithStyle(text: "數量"),
          const SizedBox(width: 10),
          ButtonWithStyle(
            text: "-",
            onPressed: () {
              _handleCount(false);
            },
            fontSize: 18,
            isCurcleshape: true,
          ),
          Expanded(
              child: Center(
            child: TextWithStyle(
              text: _count.toString(),
              fontSize: 20,
            ),
          )),
          ButtonWithStyle(
            text: "+",
            onPressed: () {
              _handleCount(true);
            },
            isCurcleshape: true,
          ),
        ],
      ),
      const SizedBox(height: 18),
      Row(children: [
        Expanded(
            child: SizedBox(
                height: 50,
                child: ButtonWithStyle(
                  text: "確認送出",
                  onPressed: () {
                    _handleConfirmButton();
                  },
                  borderRadius: 10,
                  fontSize: 16,
                )))
      ]),
      TextWithStyle(
        text: widget.productDetail.note,
        marginTop: 8,
        marginBottom: 3,
      ),
      TextWithStyle(
        text: "材質：${widget.productDetail.texture}",
        marginTop: 3,
      ),
      TextWithStyle(
        text: "厚薄：${widget.productDetail.description}",
        marginTop: 3,
      ),
      TextWithStyle(
        text: "素材產地 / ${widget.productDetail.place}",
        marginTop: 3,
      ),
      TextWithStyle(
        text: "加工產地 / ${widget.productDetail.place}",
        marginTop: 3,
      ),
    ]);
  }
}
