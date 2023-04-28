import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/data/product.dart';
import 'package:stylish/widget/text_style.dart';
import 'package:stylish/widget/button_style.dart';
import 'package:stylish/page/detail_page.dart';
import 'package:stylish/page/home_page.dart';
import 'package:stylish/bloc/product_detail_select/product_detail_select_bloc.dart';

class DetailMiddle extends StatefulWidget {
  const DetailMiddle({
    Key? key,
    required this.productDetail,
    required this.widget,
  }) : super(key: key);

  final Product productDetail;
  final DetailPage widget;

  @override
  _DetailMiddleState createState() => _DetailMiddleState();
}

class _DetailMiddleState extends State<DetailMiddle> {
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

  void _handleConfirmButton(int count) {
    if (count == 0) {
      _showAlertDialog("提示", "庫存不足", () => Navigator.pop(context));
      return;
    } else {
      _showAlertDialog(
        "成功",
        "已加入購物車",
        () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailSelectBloc, ProductDetailSelectState>(
      builder: (context, state) {
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
                    itemCount: widget.productDetail.colors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 15),
                        child: ButtonWithStyle(
                          text: "",
                          backgroundColor: Color(int.parse(
                              "0xFF${widget.productDetail.colors[index].code}")),
                          isCurcleShape: false,
                          borderColor: state.colorIndex == index
                              ? Colors.black
                              : Colors.transparent,
                          borderWidth: state.colorIndex == index ? 2 : 0,
                          onPressed: () {
                            BlocProvider.of<ProductDetailSelectBloc>(context)
                                .add(ColorSelectEvent(
                                    productDetail: widget.productDetail,
                                    colorIndex: index));
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
                            backgroundColor: state.sizeIndex == index
                                ? Colors.grey
                                : Colors.white,
                            foregroundColor: state.sizeIndex == index
                                ? Colors.white
                                : Colors.black,
                            onPressed: () {
                              BlocProvider.of<ProductDetailSelectBloc>(context)
                                  .add(SizeSelectEvent(
                                      productDetail: widget.productDetail,
                                      sizeIndex: index));
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
                  BlocProvider.of<ProductDetailSelectBloc>(context).add(
                      DecrementCountEvent(productDetail: widget.productDetail));
                },
                fontSize: 18,
                isCurcleShape: true,
              ),
              Expanded(
                  child: Center(
                child: TextWithStyle(
                  text: state.count.toString(),
                  fontSize: 20,
                ),
              )),
              ButtonWithStyle(
                text: "+",
                onPressed: () {
                  BlocProvider.of<ProductDetailSelectBloc>(context).add(
                      IncrementCountEvent(productDetail: widget.productDetail));
                },
                isCurcleShape: true,
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
                        BlocProvider.of<ProductDetailSelectBloc>(context)
                            .add(ComfirmEvent());
                        _handleConfirmButton(state.count);
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
      },
    );
  }
}
