import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/utils.dart' ;
import '../controllers/chatscreen_controller.dart';
import '../../messageScree/views/message_scree_view.dart';

class ChatscreenView extends GetView<ChatscreenController> {
  const ChatscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backgroundDark),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Find Your Workers',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'DM Sans',
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Utils.searchBar(
                  hintText: 'Search...',
                  fillColor: Colors.white.withAlpha(25),
                  borderRadius: 30,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
              children: [

                _buildChatItem(
                  name: 'Jonak',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Michael tony',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Joseph ray',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Thomas adison',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Jira',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Michael tony',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Joseph ray',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Jira',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Michael tony',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Joseph ray',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Jira',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Michael tony',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
                _buildChatItem(
                  name: 'Joseph ray',
                  message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit,',
                  time: '10 min',
                  unreadCount: '2',
                ),
              ],
            ),
        ),
      ],
    );
  }

  /// ============================
  /// Chat Item Widget
  /// ============================
  Widget _buildChatItem({
    required String name,
    required String message,
    required String time,
    required String unreadCount,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => const MessageScreeView(),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Profile Image (Asset)
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              /// Name & Message
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF3D3D3D),
                        fontSize: 16,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF636363),
                        fontSize: 12,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              /// Time & Unread Badge
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF071727),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      unreadCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

          /// Bottom Divider
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 1,
              thickness: 1,
              color: const Color(0xFF2A3D5F).withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
