import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:book_grocer/view/login/sign_in_view.dart';
import 'package:book_grocer/common/color_extenstion.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: TColor.primary),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.displayName ?? 'Chao Chealy',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Constantly travelling and keeping up to date with business related books.',
                          style: TextStyle(
                            fontSize: 14,
                            color: TColor.subTitle,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.send, size: 16, color: TColor.subTitle),
                            const SizedBox(width: 4),
                            Text(
                              'Newcastle - Australia',
                              style: TextStyle(
                                fontSize: 14,
                                color: TColor.subTitle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Profile Picture
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'C',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Edit Profile Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [TColor.primary, TColor.primary.withOpacity(0.8)],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Edit profile functionality
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Statistics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        '21',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: TColor.text,
                        ),
                      ),
                      Text(
                        'Books',
                        style: TextStyle(
                          fontSize: 14,
                          color: TColor.subTitle,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: TColor.text,
                        ),
                      ),
                      Text(
                        'Reviews',
                        style: TextStyle(
                          fontSize: 14,
                          color: TColor.subTitle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Your Purchases Section
              Text(
                'Your purchases (21)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: TColor.text,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildPurchaseCard(
                      'GROSS ANATOMY',
                      'My CURIOUS RELATIONSHIP with the FEMALE',
                      'assets/img/b1.jpg',
                    ),
                    _buildPurchaseCard(
                      'INDIES',
                      'THE EPIC HISTORY OF THE RECORD INDUSTRY',
                      'assets/img/b2.jpg',
                    ),
                    _buildPurchaseCard(
                      'Big Disruption',
                      'Larry I and Paul F',
                      'assets/img/b3.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Your Reviews Section
              Text(
                'Your reviews (7)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: TColor.text,
                ),
              ),
              const SizedBox(height: 15),
              _buildReviewCard(
                'A must read for everybody. This book taught me so many things about...',
                'Read more >',
                3.5,
                'assets/img/b1.jpg',
              ),
              const SizedBox(height: 15),
              _buildReviewCard(
                '#1 international bestseller and award winning history book',
                'Read more >',
                5,
                'assets/img/b2.jpg',
              ),
              const SizedBox(height: 30),
              // Sign Out Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPurchaseCard(String title, String author, String imagePath) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 10,
              color: TColor.subTitle,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(
      String review, String readMore, double rating, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review,
                  style: TextStyle(
                    fontSize: 14,
                    color: TColor.subTitle,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      readMore,
                      style: TextStyle(
                        fontSize: 12,
                        color: TColor.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Row(
                      children: List.generate(5, (index) {
                        if (index < rating.floor()) {
                          return Icon(
                            Icons.star,
                            size: 16,
                            color: TColor.primary,
                          );
                        } else if (index == rating.floor() && rating % 1 > 0) {
                          return Icon(
                            Icons.star_half,
                            size: 16,
                            color: TColor.primary,
                          );
                        } else {
                          return Icon(
                            Icons.star_border,
                            size: 16,
                            color: Colors.grey,
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            width: 50,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
