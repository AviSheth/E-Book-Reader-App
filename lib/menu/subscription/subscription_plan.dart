import 'package:e_book_reader/Database/DatabaseHelper.dart';
import 'package:e_book_reader/Database/sharedPrefeHelper.dart';
import 'package:e_book_reader/menu/subscription/successPaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedPlan = 0;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
  // print("Save Email: ${prefs.getString('email')}");
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlerPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);

    //_ensureEmailExists();
    _ensureUserLoggedIn();

  }
  Future<void> _loadSubscriptionData(String email) async {
    final prefs = await SharedPrefHelper.getInstance();
    final email = prefs.getUserEmail();
    print('Loading subscription data for: $email');
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  Future<void> _ensureUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');

    if (email == null || email.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please log in before subscribing.')),
        );
        Navigator.pushReplacementNamed(context, '/login'); // Redirect to login
      }
    } else {
      _loadSubscriptionData(email); // Now you can pass the email to the load function
    }
  }

  /*void _ensureEmailExists() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');

    if (email == null || email.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please log in before subscribing.')),
      );
      Navigator.pushReplacementNamed(context, '/login'); // 👈 Optional redirect
    }
  }*/


  void onSubscribe() {
    var option = {
      'key': 'rzp_test_brrNmGq2aGyWyX',
      'amount': selectedPlan == 0 ? 19900 : 149900,
      'name': 'E-Book Reader',
      'description': selectedPlan == 0 ? "Monthly Plan" : "Yearly Plan",
     'theme':{
     'color': '#448AFF',
     },
      'prefill': {
        'contact': '8155856680',
        'email': 'avisheth34@example.com',
      },
      'currency': 'INR',
    };

    try {
      _razorpay.open(option);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Correct: Read the email from SharedPreferences
      final email = prefs.getString('email');

      if (email == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email not found. Please login again.')),
        );
        return;
      }

      // Save subscription info
      await prefs.setString('subscription_plan', selectedPlan == 0 ? 'monthly' : 'yearly');
      final expiryDate = DateTime.now().add(
        selectedPlan == 0 ? const Duration(days: 30) : const Duration(days: 365),
      );
      await prefs.setString('subscription_expiry', expiryDate.toIso8601String());

      // Update subscription in database
      await DatabaseHelper.instance.updateSubscription(
        email: email,
        isSubscribed: true,
        subscriptionPlan: selectedPlan == 0 ? 'monthly' : 'yearly',
        subscriptionExpiry: expiryDate,
      );

      _razorpay.clear();

      // Navigate to success page
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SubscriptionSuccessPage()),
      );
    } catch (e) {
      print('Payment success handling failed: $e');
    }
  }


  void _handlerPaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Payment Failed: ${response.message}")));
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("EXTERNAL_WALLET: ${response.walletName}")));
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.subscriptionPlans),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              loc.chooseSubscriptionPlan,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            _buildPlanCard(
              icon: Icons.calendar_month,
              title: loc.monthlyPlan,
              subtitle: "₹199 / month",
              selected: selectedPlan == 0,
              onTap: () => setState(() => selectedPlan = 0),
            ),
            const SizedBox(height: 20),

            _buildPlanCard(
              icon: Icons.calendar_view_month,
              title: loc.yearlyPlan,
              subtitle: "₹1499 / year",
              selected: selectedPlan == 1,
              onTap: () => setState(() => selectedPlan = 1),
            ),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: onSubscribe,
                icon: Icon(Icons.payment, size: 20, color: Colors.white,),
                label: Text(
                  loc.subscribeNow,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent[50] : Colors.white,
          border: Border.all(
              color: selected ? Colors.blueAccent : Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Colors.blueAccent),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, color: Colors.green, size: 26),
          ],
        ),
      ),
    );
  }
}
