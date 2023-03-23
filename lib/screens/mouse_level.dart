import 'package:digital_education/screens/keyboard_level.dart';
import 'package:digital_education/utils/app_colors.dart';
import 'package:digital_education/utils/media_query_values.dart';
import 'package:digital_education/widgets/form_fields.dart';
import 'package:digital_education/widgets/main_button.dart';
import 'package:digital_education/widgets/routs.dart';
import 'package:digital_education/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MouseScreen extends StatefulWidget {
  const MouseScreen({super.key});

  @override
  State<MouseScreen> createState() => _MouseScreenState();
}

class _MouseScreenState extends State<MouseScreen> {
  TextEditingController anserController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool showContainer = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGround,
      appBar: AppBar(
        leading: Icon(
          Icons.abc,
          color: AppColors.backGround,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.backGround,
        title: Text(
          "الفأرة",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
                top: context.height * 0.05,
                right: context.width * 0.09,
                left: context.width * 0.09),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                        width: context.width * 0.8,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/mouse.jpg",
                        )),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    " : المستوي الأول ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Container(
                    color: AppColors.textColor,
                    width: context.width * 0.48,
                    height: 2,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    "الفأرة هي إحدى وحدات الإدخال في الحاسوب التي تُستعمل يدوياً للتأشير والنقر في الواجهة الرسومية",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textColor, fontSize: 25),
                    textAlign: TextAlign.end,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  TextArt(
                    text:
                        " إذا كنت تريد فتح شيء ما ، حرك مؤشر الماوس إليه ثم انقر فوقه نقرًا مزدوجًا",
                    textColor: AppColors.textColor,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Lottie.asset(
                      "assets/animation/click.json",
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  TextArt(
                    text:
                        "إذا كنت تريد فتح الخيارات ، فانقر بزر الماوس الأيسر فوق أي شيء",
                    textColor: AppColors.textColor,
                  ),
                  SizedBox(
                    height: context.height * 0.06,
                  ),
                  TextArt(
                    text:
                        "إذا كنت تريد التمرير فقط قم بالتمرير بالماوس في المنتصف",
                    textColor: AppColors.textColor,
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Lottie.asset(
                    "assets/animation/scroll.json",
                  ),
                  SizedBox(
                    height: context.height * 0.1,
                  ),
                  TextArt(
                      text: " كيفية فتح شيء ما؟ ",
                      textColor: AppColors.textColor),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  defaultFormField(
                      controller: anserController,
                      type: TextInputType.text,
                      validate: (String value) {
                        if (value != "انقر نقرا مزدوجا فوقه") {
                          return "الأجابة خاطئة";
                        }
                      },
                      hint: "أدخل الأجابة"),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  Center(
                    child: MainButton(
                        text: "إدخال",
                        width: context.width * 0.8,
                        height: context.height * 0.1,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              showContainer = true;
                              navigateAndFinish(
                                  context, const KeyboardScreen());
                            });
                          }
                        },
                        backGround: AppColors.primary,
                        textColor: AppColors.textColor,
                        fontSize: 30),
                  ),
                  Center(
                    child: Lottie.asset(
                      "assets/animation/congrts.json",
                      height: showContainer ? 200 : 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
