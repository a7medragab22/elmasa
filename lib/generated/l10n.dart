// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `almasa`
  String get title {
    return Intl.message('almasa', name: 'title', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Menu`
  String get menu {
    return Intl.message('Menu', name: 'menu', desc: '', args: []);
  }

  /// `Fabrics`
  String get fabrics {
    return Intl.message('Fabrics', name: 'fabrics', desc: '', args: []);
  }

  /// `Abayas`
  String get abayas {
    return Intl.message('Abayas', name: 'abayas', desc: '', args: []);
  }

  /// `Clothes`
  String get clothes {
    return Intl.message('Clothes', name: 'clothes', desc: '', args: []);
  }

  /// `Leather`
  String get leather {
    return Intl.message('Leather', name: 'leather', desc: '', args: []);
  }

  /// `Giveaways`
  String get giveaways {
    return Intl.message('Giveaways', name: 'giveaways', desc: '', args: []);
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Support Tags`
  String get supportTags {
    return Intl.message(
      'Support Tags',
      name: 'supportTags',
      desc: '',
      args: [],
    );
  }

  /// `For Sale`
  String get forSale {
    return Intl.message('For Sale', name: 'forSale', desc: '', args: []);
  }

  /// `Selected Items`
  String get selectedItems {
    return Intl.message(
      'Selected Items',
      name: 'selectedItems',
      desc: '',
      args: [],
    );
  }

  /// `Premium`
  String get premium {
    return Intl.message('Premium', name: 'premium', desc: '', args: []);
  }

  /// `Luxury Fabrics`
  String get luxuryFabrics {
    return Intl.message(
      'Luxury Fabrics',
      name: 'luxuryFabrics',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message('Discover', name: 'discover', desc: '', args: []);
  }

  /// `New Arrivals`
  String get newArrivals {
    return Intl.message(
      'New Arrivals',
      name: 'newArrivals',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Route not found`
  String get routeNotFound {
    return Intl.message(
      'Route not found',
      name: 'routeNotFound',
      desc: '',
      args: [],
    );
  }

  /// `THE FIRST DESTINATION FOR ALL\n✨ WOMEN'S DETAILS`
  String get footerTitle {
    return Intl.message(
      'THE FIRST DESTINATION FOR ALL\n✨ WOMEN\'S DETAILS',
      name: 'footerTitle',
      desc: '',
      args: [],
    );
  }

  /// `COMMERCIAL REGISTRATION`
  String get commercialRegistration {
    return Intl.message(
      'COMMERCIAL REGISTRATION',
      name: 'commercialRegistration',
      desc: '',
      args: [],
    );
  }

  /// `TAX NUMBER`
  String get taxNumber {
    return Intl.message('TAX NUMBER', name: 'taxNumber', desc: '', args: []);
  }

  /// `Important Links`
  String get importantLinks {
    return Intl.message(
      'Important Links',
      name: 'importantLinks',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message('Blog', name: 'blog', desc: '', args: []);
  }

  /// `Return Policy`
  String get returnPolicy {
    return Intl.message(
      'Return Policy',
      name: 'returnPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Service`
  String get deliveryService {
    return Intl.message(
      'Delivery Service',
      name: 'deliveryService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Return Method`
  String get returnMethod {
    return Intl.message(
      'Return Method',
      name: 'returnMethod',
      desc: '',
      args: [],
    );
  }

  /// `Gift Policy`
  String get giftPolicy {
    return Intl.message('Gift Policy', name: 'giftPolicy', desc: '', args: []);
  }

  /// `Sad VIP Points`
  String get sadVipPoints {
    return Intl.message(
      'Sad VIP Points',
      name: 'sadVipPoints',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `WhatsApp`
  String get whatsapp {
    return Intl.message('WhatsApp', name: 'whatsapp', desc: '', args: []);
  }

  /// `Certified on the Business Platform`
  String get certifiedPlatform {
    return Intl.message(
      'Certified on the Business Platform',
      name: 'certifiedPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Could not open link:`
  String get couldNotOpenLink {
    return Intl.message(
      'Could not open link:',
      name: 'couldNotOpenLink',
      desc: '',
      args: [],
    );
  }

  /// `Please restart the app completely to load the new url_launcher package!`
  String get restartAppUrlLauncher {
    return Intl.message(
      'Please restart the app completely to load the new url_launcher package!',
      name: 'restartAppUrlLauncher',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Login successful`
  String get loginSuccessful {
    return Intl.message(
      'Login successful',
      name: 'loginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please verify your email`
  String get verifyEmail {
    return Intl.message(
      'Please verify your email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgotPasswordQuestion {
    return Intl.message(
      'Forgot your password?',
      name: 'forgotPasswordQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to receive a password reset link.`
  String get forgotPasswordSubtitle {
    return Intl.message(
      'Enter your email address to receive a password reset link.',
      name: 'forgotPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Send Link`
  String get sendLink {
    return Intl.message('Send Link', name: 'sendLink', desc: '', args: []);
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordTitle {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Set New Password`
  String get setNewPassword {
    return Intl.message(
      'Set New Password',
      name: 'setNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previously used passwords.`
  String get resetPasswordSubtitle {
    return Intl.message(
      'Your new password must be different from previously used passwords.',
      name: 'resetPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verificationTitle {
    return Intl.message(
      'Verification',
      name: 'verificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 4-digit code sent to your email address.`
  String get verificationSubtitle {
    return Intl.message(
      'Please enter the 4-digit code sent to your email address.',
      name: 'verificationSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Didn't receive code? `
  String get didNotReceiveCode {
    return Intl.message(
      'Didn\'t receive code? ',
      name: 'didNotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Cart updated`
  String get cartUpdated {
    return Intl.message(
      'Cart updated',
      name: 'cartUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message('Buy Now', name: 'buyNow', desc: '', args: []);
  }

  /// `Quantity`
  String get quantity {
    return Intl.message('Quantity', name: 'quantity', desc: '', args: []);
  }

  /// `Flexible Payment Options`
  String get flexiblePaymentOptions {
    return Intl.message(
      'Flexible Payment Options',
      name: 'flexiblePaymentOptions',
      desc: '',
      args: [],
    );
  }

  /// `Split in 4 payments`
  String get splitIn4Payments {
    return Intl.message(
      'Split in 4 payments',
      name: 'splitIn4Payments',
      desc: '',
      args: [],
    );
  }

  /// `4 × SAR`
  String get fourTimesSar {
    return Intl.message('4 × SAR', name: 'fourTimesSar', desc: '', args: []);
  }

  /// `Buy now, pay later`
  String get buyNowPayLater {
    return Intl.message(
      'Buy now, pay later',
      name: 'buyNowPayLater',
      desc: '',
      args: [],
    );
  }

  /// `0% interest`
  String get zeroInterest {
    return Intl.message(
      '0% interest',
      name: 'zeroInterest',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetailsTab {
    return Intl.message(
      'Product Details',
      name: 'productDetailsTab',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `No details available`
  String get noDetailsAvailable {
    return Intl.message(
      'No details available',
      name: 'noDetailsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No reviews yet`
  String get noReviewsYet {
    return Intl.message(
      'No reviews yet',
      name: 'noReviewsYet',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to review this product`
  String get beTheFirstToReview {
    return Intl.message(
      'Be the first to review this product',
      name: 'beTheFirstToReview',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message('Filters', name: 'filters', desc: '', args: []);
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message('Price Range', name: 'priceRange', desc: '', args: []);
  }

  /// `Min`
  String get min {
    return Intl.message('Min', name: 'min', desc: '', args: []);
  }

  /// `Max`
  String get max {
    return Intl.message('Max', name: 'max', desc: '', args: []);
  }

  /// `Rating`
  String get rating {
    return Intl.message('Rating', name: 'rating', desc: '', args: []);
  }

  /// `Only`
  String get only {
    return Intl.message('Only', name: 'only', desc: '', args: []);
  }

  /// `& Up`
  String get andUp {
    return Intl.message('& Up', name: 'andUp', desc: '', args: []);
  }

  /// `Apply Filters`
  String get applyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Newest First`
  String get newestFirst {
    return Intl.message(
      'Newest First',
      name: 'newestFirst',
      desc: '',
      args: [],
    );
  }

  /// `Price: Low to High`
  String get priceLowToHigh {
    return Intl.message(
      'Price: Low to High',
      name: 'priceLowToHigh',
      desc: '',
      args: [],
    );
  }

  /// `Price: High to Low`
  String get priceHighToLow {
    return Intl.message(
      'Price: High to Low',
      name: 'priceHighToLow',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get productsTitle {
    return Intl.message('Products', name: 'productsTitle', desc: '', args: []);
  }

  /// `No products found`
  String get noProductsFound {
    return Intl.message(
      'No products found',
      name: 'noProductsFound',
      desc: '',
      args: [],
    );
  }

  /// `Try adjusting your filters`
  String get tryAdjustingFilters {
    return Intl.message(
      'Try adjusting your filters',
      name: 'tryAdjustingFilters',
      desc: '',
      args: [],
    );
  }

  /// `Reset Filters`
  String get resetFilters {
    return Intl.message(
      'Reset Filters',
      name: 'resetFilters',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `Browse our collections`
  String get browseOurCollections {
    return Intl.message(
      'Browse our collections',
      name: 'browseOurCollections',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message('Filter', name: 'filter', desc: '', args: []);
  }

  /// `Sort by:`
  String get sortBy {
    return Intl.message('Sort by:', name: 'sortBy', desc: '', args: []);
  }

  /// `NEW`
  String get newBadge {
    return Intl.message('NEW', name: 'newBadge', desc: '', args: []);
  }

  /// `SAR`
  String get sar {
    return Intl.message('SAR', name: 'sar', desc: '', args: []);
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `items`
  String get items {
    return Intl.message('items', name: 'items', desc: '', args: []);
  }

  /// `Your cart is empty`
  String get yourCartIsEmpty {
    return Intl.message(
      'Your cart is empty',
      name: 'yourCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add some items to start shopping!`
  String get addItemsToStartShopping {
    return Intl.message(
      'Add some items to start shopping!',
      name: 'addItemsToStartShopping',
      desc: '',
      args: [],
    );
  }

  /// `Start Shopping`
  String get startShopping {
    return Intl.message(
      'Start Shopping',
      name: 'startShopping',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shoppingCart {
    return Intl.message(
      'Shopping Cart',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `VAT (15%)`
  String get vat {
    return Intl.message('VAT (15%)', name: 'vat', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Proceed to Checkout`
  String get proceedToCheckout {
    return Intl.message(
      'Proceed to Checkout',
      name: 'proceedToCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Billing & Shipping Details`
  String get billingAndShippingDetails {
    return Intl.message(
      'Billing & Shipping Details',
      name: 'billingAndShippingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get enterYourFullName {
    return Intl.message(
      'Enter your full name',
      name: 'enterYourFullName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `+966 XX XXX XXXX`
  String get phoneHint {
    return Intl.message(
      '+966 XX XXX XXXX',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Email (Optional)`
  String get emailOptional {
    return Intl.message(
      'Email (Optional)',
      name: 'emailOptional',
      desc: '',
      args: [],
    );
  }

  /// `your@email.com`
  String get emailHint {
    return Intl.message(
      'your@email.com',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Riyadh, Jeddah, etc.`
  String get cityHint {
    return Intl.message(
      'Riyadh, Jeddah, etc.',
      name: 'cityHint',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Street, Building, Apartment`
  String get addressHint {
    return Intl.message(
      'Street, Building, Apartment',
      name: 'addressHint',
      desc: '',
      args: [],
    );
  }

  /// `Order placed successfully!`
  String get orderPlacedSuccessfully {
    return Intl.message(
      'Order placed successfully!',
      name: 'orderPlacedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message('Shipping', name: 'shipping', desc: '', args: []);
  }

  /// `FREE`
  String get free {
    return Intl.message('FREE', name: 'free', desc: '', args: []);
  }

  /// `Total Amount`
  String get totalAmount {
    return Intl.message(
      'Total Amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Complete your order`
  String get completeYourOrder {
    return Intl.message(
      'Complete your order',
      name: 'completeYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get thisFieldIsRequired {
    return Intl.message(
      'This field is required',
      name: 'thisFieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Premium Collection`
  String get premiumCollection {
    return Intl.message(
      'Premium Collection',
      name: 'premiumCollection',
      desc: '',
      args: [],
    );
  }

  /// `Get in Touch`
  String get getInTouch {
    return Intl.message('Get in Touch', name: 'getInTouch', desc: '', args: []);
  }

  /// `We are here to help`
  String get weAreHereToHelp {
    return Intl.message(
      'We are here to help',
      name: 'weAreHereToHelp',
      desc: '',
      args: [],
    );
  }

  /// `Customer Service\nWhatsApp`
  String get customerServiceWhatsapp {
    return Intl.message(
      'Customer Service\nWhatsApp',
      name: 'customerServiceWhatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Unified Phone`
  String get unifiedPhone {
    return Intl.message(
      'Unified Phone',
      name: 'unifiedPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Message Type`
  String get messageType {
    return Intl.message(
      'Message Type',
      name: 'messageType',
      desc: '',
      args: [],
    );
  }

  /// `Select Type`
  String get selectType {
    return Intl.message('Select Type', name: 'selectType', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `Write your message here...`
  String get writeYourMessageHere {
    return Intl.message(
      'Write your message here...',
      name: 'writeYourMessageHere',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Working Hours`
  String get workingHours {
    return Intl.message(
      'Working Hours',
      name: 'workingHours',
      desc: '',
      args: [],
    );
  }

  /// `Sunday to Thursday`
  String get sundayToThursday {
    return Intl.message(
      'Sunday to Thursday',
      name: 'sundayToThursday',
      desc: '',
      args: [],
    );
  }

  /// `9:00 AM - 9:00 PM`
  String get workingHoursTime {
    return Intl.message(
      '9:00 AM - 9:00 PM',
      name: 'workingHoursTime',
      desc: '',
      args: [],
    );
  }

  /// `Inquiry`
  String get inquiry {
    return Intl.message('Inquiry', name: 'inquiry', desc: '', args: []);
  }

  /// `Complaint`
  String get complaint {
    return Intl.message('Complaint', name: 'complaint', desc: '', args: []);
  }

  /// `Suggestion`
  String get suggestion {
    return Intl.message('Suggestion', name: 'suggestion', desc: '', args: []);
  }

  /// `Error:`
  String get error {
    return Intl.message('Error:', name: 'error', desc: '', args: []);
  }

  /// `Favourite`
  String get myWishlist {
    return Intl.message('Favourite', name: 'myWishlist', desc: '', args: []);
  }

  /// `items saved`
  String get itemsSaved {
    return Intl.message('items saved', name: 'itemsSaved', desc: '', args: []);
  }

  /// `Your wishlist is empty`
  String get yourWishlistIsEmpty {
    return Intl.message(
      'Your wishlist is empty',
      name: 'yourWishlistIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Save items you love to find them later!`
  String get saveItemsYouLove {
    return Intl.message(
      'Save items you love to find them later!',
      name: 'saveItemsYouLove',
      desc: '',
      args: [],
    );
  }

  /// `Explore Products`
  String get exploreProducts {
    return Intl.message(
      'Explore Products',
      name: 'exploreProducts',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Intellectual Property &\nLicense`
  String get intellectualPropertyTitle {
    return Intl.message(
      'Intellectual Property &\nLicense',
      name: 'intellectualPropertyTitle',
      desc: '',
      args: [],
    );
  }

  /// `All content available on this site (including text, design, graphics, logos, icons, images, audio clips, and software) is the exclusive property of (Saad) and its licensors. Saad grants you a limited license for personal use of this site. Saad retains full ownership of this content.`
  String get intellectualPropertyContent {
    return Intl.message(
      'All content available on this site (including text, design, graphics, logos, icons, images, audio clips, and software) is the exclusive property of (Saad) and its licensors. Saad grants you a limited license for personal use of this site. Saad retains full ownership of this content.',
      name: 'intellectualPropertyContent',
      desc: '',
      args: [],
    );
  }

  /// `Weekend Flash Sale`
  String get weekendFlashSaleTitle {
    return Intl.message(
      'Weekend Flash Sale',
      name: 'weekendFlashSaleTitle',
      desc: '',
      args: [],
    );
  }

  /// `The 25% discount code [WEEK25] applies to selected items only for 48 hours. The discount does not include free shipping and cannot be combined with other offers. Vouchers and coupons do not apply to discounted products.`
  String get weekendFlashSaleContent {
    return Intl.message(
      'The 25% discount code [WEEK25] applies to selected items only for 48 hours. The discount does not include free shipping and cannot be combined with other offers. Vouchers and coupons do not apply to discounted products.',
      name: 'weekendFlashSaleContent',
      desc: '',
      args: [],
    );
  }

  /// `Orders & Pricing`
  String get ordersPricingTitle {
    return Intl.message(
      'Orders & Pricing',
      name: 'ordersPricingTitle',
      desc: '',
      args: [],
    );
  }

  /// `All orders are subject to acceptance. We reserve the right to refuse or cancel orders for any reason. Stock availability is not guaranteed. All prices are correct at the time of entry but may change.`
  String get ordersPricingContent {
    return Intl.message(
      'All orders are subject to acceptance. We reserve the right to refuse or cancel orders for any reason. Stock availability is not guaranteed. All prices are correct at the time of entry but may change.',
      name: 'ordersPricingContent',
      desc: '',
      args: [],
    );
  }

  /// `Prices & Payment\nPolicy`
  String get pricesPaymentPolicyTitle {
    return Intl.message(
      'Prices & Payment\nPolicy',
      name: 'pricesPaymentPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Prices include VAT. Card payments are subject to verification. Card details must match the holder. Card data will not be stored or sold to third parties, except for the payment gateway.`
  String get pricesPaymentPolicyContent {
    return Intl.message(
      'Prices include VAT. Card payments are subject to verification. Card details must match the holder. Card data will not be stored or sold to third parties, except for the payment gateway.',
      name: 'pricesPaymentPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `Offers & Discounts`
  String get offersDiscountsTitle {
    return Intl.message(
      'Offers & Discounts',
      name: 'offersDiscountsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Code [free10] gives free shipping for 6 months for orders over 199 SAR (App only). ACTAN code applies to (New Saad). AC100 code applies to (New Saad) excluding discounted items.`
  String get offersDiscountsContent {
    return Intl.message(
      'Code [free10] gives free shipping for 6 months for orders over 199 SAR (App only). ACTAN code applies to (New Saad). AC100 code applies to (New Saad) excluding discounted items.',
      name: 'offersDiscountsContent',
      desc: '',
      args: [],
    );
  }

  /// `Offer Return Policy`
  String get offerReturnPolicyTitle {
    return Intl.message(
      'Offer Return Policy',
      name: 'offerReturnPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Orders within (2 for 95) offer: Individual items cannot be returned; the full offer must be returned. For more than 2 items, returns must be in even numbers.`
  String get offerReturnPolicyContent {
    return Intl.message(
      'Orders within (2 for 95) offer: Individual items cannot be returned; the full offer must be returned. For more than 2 items, returns must be in even numbers.',
      name: 'offerReturnPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `Liability & Privacy`
  String get liabilityPrivacyTitle {
    return Intl.message(
      'Liability & Privacy',
      name: 'liabilityPrivacyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your submission of personal information is subject to our Privacy Policy. Your use of the site is at your own risk. Saad does not guarantee the site is free from interruptions or errors and is not liable for damages resulting from its use. You agree to indemnify and defend Saad against any claims.`
  String get liabilityPrivacyContent {
    return Intl.message(
      'Your submission of personal information is subject to our Privacy Policy. Your use of the site is at your own risk. Saad does not guarantee the site is free from interruptions or errors and is not liable for damages resulting from its use. You agree to indemnify and defend Saad against any claims.',
      name: 'liabilityPrivacyContent',
      desc: '',
      args: [],
    );
  }

  /// `Law & Disputes`
  String get lawDisputesTitle {
    return Intl.message(
      'Law & Disputes',
      name: 'lawDisputesTitle',
      desc: '',
      args: [],
    );
  }

  /// `These terms constitute the entire agreement. If any part is void, the rest remains valid. These terms are governed by the laws of Saudi Arabia. Parties agree to attempt amicable dispute resolution within 30 days before legal action.`
  String get lawDisputesContent {
    return Intl.message(
      'These terms constitute the entire agreement. If any part is void, the rest remains valid. These terms are governed by the laws of Saudi Arabia. Parties agree to attempt amicable dispute resolution within 30 days before legal action.',
      name: 'lawDisputesContent',
      desc: '',
      args: [],
    );
  }

  /// `Replies & Comments`
  String get repliesCommentsTitle {
    return Intl.message(
      'Replies & Comments',
      name: 'repliesCommentsTitle',
      desc: '',
      args: [],
    );
  }

  /// `We welcome comments but do not accept confidential info. All submissions become exclusive property of Saad. Profanity or fake addresses are prohibited. We reserve the right to delete or edit data.`
  String get repliesCommentsContent {
    return Intl.message(
      'We welcome comments but do not accept confidential info. All submissions become exclusive property of Saad. Profanity or fake addresses are prohibited. We reserve the right to delete or edit data.',
      name: 'repliesCommentsContent',
      desc: '',
      args: [],
    );
  }

  /// `Order Modification`
  String get orderModificationTitle {
    return Intl.message(
      'Order Modification',
      name: 'orderModificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `For speed of execution, the order becomes final and unmodifiable after payment. The customer is responsible for reviewing data before completion.`
  String get orderModificationContent {
    return Intl.message(
      'For speed of execution, the order becomes final and unmodifiable after payment. The customer is responsible for reviewing data before completion.',
      name: 'orderModificationContent',
      desc: '',
      args: [],
    );
  }

  /// `All rights reserved © Saad 2026`
  String get allRightsReserved {
    return Intl.message(
      'All rights reserved © Saad 2026',
      name: 'allRightsReserved',
      desc: '',
      args: [],
    );
  }

  /// `At Saad, we respect your privacy and your right to choose how your information is used. One of our top priorities is protecting the information we hold.`
  String get privacyPolicyDesc1 {
    return Intl.message(
      'At Saad, we respect your privacy and your right to choose how your information is used. One of our top priorities is protecting the information we hold.',
      name: 'privacyPolicyDesc1',
      desc: '',
      args: [],
    );
  }

  /// `We do not share customer information (including email addresses) with any third party unless necessary to provide the products and services we offer. We will only disclose information when we have the right to do so.`
  String get privacyPolicyDesc2 {
    return Intl.message(
      'We do not share customer information (including email addresses) with any third party unless necessary to provide the products and services we offer. We will only disclose information when we have the right to do so.',
      name: 'privacyPolicyDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Payment Security: We do not store any details of your credit card.`
  String get paymentSecurityDesc {
    return Intl.message(
      'Payment Security: We do not store any details of your credit card.',
      name: 'paymentSecurityDesc',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions or concerns about Saad's access to or use of your personal information, please contact us via email or at phone number 920010063.`
  String get privacyPolicyContact {
    return Intl.message(
      'If you have any questions or concerns about Saad\'s access to or use of your personal information, please contact us via email or at phone number 920010063.',
      name: 'privacyPolicyContact',
      desc: '',
      args: [],
    );
  }

  /// `Click this link\nto start the\nreturn\nprocess`
  String get clickLinkToStartReturn {
    return Intl.message(
      'Click this link\nto start the\nreturn\nprocess',
      name: 'clickLinkToStartReturn',
      desc: '',
      args: [],
    );
  }

  /// `For a better shopping experience, we added new options:`
  String get newOptionsAdded {
    return Intl.message(
      'For a better shopping experience, we added new options:',
      name: 'newOptionsAdded',
      desc: '',
      args: [],
    );
  }

  /// `When returning a product or the entire order, a return fee of 29 SAR will be deducted from the refund amount.`
  String get returnFeeDeduction {
    return Intl.message(
      'When returning a product or the entire order, a return fee of 29 SAR will be deducted from the refund amount.',
      name: 'returnFeeDeduction',
      desc: '',
      args: [],
    );
  }

  /// `You can return the product within 7 days of receipt.`
  String get returnWithin7Days {
    return Intl.message(
      'You can return the product within 7 days of receipt.',
      name: 'returnWithin7Days',
      desc: '',
      args: [],
    );
  }

  /// `No return or exchange for online orders at branches.`
  String get noReturnAtBranches {
    return Intl.message(
      'No return or exchange for online orders at branches.',
      name: 'noReturnAtBranches',
      desc: '',
      args: [],
    );
  }

  /// `Exchange of products purchased from the online store is not allowed.`
  String get noExchangeOnline {
    return Intl.message(
      'Exchange of products purchased from the online store is not allowed.',
      name: 'noExchangeOnline',
      desc: '',
      args: [],
    );
  }

  /// `The product must be in its original condition without damage.`
  String get originalConditionRequired {
    return Intl.message(
      'The product must be in its original condition without damage.',
      name: 'originalConditionRequired',
      desc: '',
      args: [],
    );
  }

  /// `The return policy applies to all products except accessories.`
  String get returnExceptAccessories {
    return Intl.message(
      'The return policy applies to all products except accessories.',
      name: 'returnExceptAccessories',
      desc: '',
      args: [],
    );
  }

  /// `Promotional Offer\nReturn Terms &\nConditions`
  String get promoOfferReturnTerms {
    return Intl.message(
      'Promotional Offer\nReturn Terms &\nConditions',
      name: 'promoOfferReturnTerms',
      desc: '',
      args: [],
    );
  }

  /// `All products included in the promotional offer must be returned in full.`
  String get promoOfferReturnFull {
    return Intl.message(
      'All products included in the promotional offer must be returned in full.',
      name: 'promoOfferReturnFull',
      desc: '',
      args: [],
    );
  }

  /// `Return Steps`
  String get returnSteps {
    return Intl.message(
      'Return Steps',
      name: 'returnSteps',
      desc: '',
      args: [],
    );
  }

  /// `1. Go to My Orders panel`
  String get returnStep1 {
    return Intl.message(
      '1. Go to My Orders panel',
      name: 'returnStep1',
      desc: '',
      args: [],
    );
  }

  /// `2. Create Return Form`
  String get returnStep2 {
    return Intl.message(
      '2. Create Return Form',
      name: 'returnStep2',
      desc: '',
      args: [],
    );
  }

  /// `3. The policy will be sent to your email within 48 hours`
  String get returnStep3 {
    return Intl.message(
      '3. The policy will be sent to your email within 48 hours',
      name: 'returnStep3',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message('Notes', name: 'notes', desc: '', args: []);
  }

  /// `The order cannot be cancelled after confirmation.`
  String get noCancelAfterConfirm {
    return Intl.message(
      'The order cannot be cancelled after confirmation.',
      name: 'noCancelAfterConfirm',
      desc: '',
      args: [],
    );
  }

  /// `The amount will be refunded within 14 working days.`
  String get refundWithin14Days {
    return Intl.message(
      'The amount will be refunded within 14 working days.',
      name: 'refundWithin14Days',
      desc: '',
      args: [],
    );
  }

  /// `Contact us via WhatsApp\n\nto start return`
  String get contactWhatsappToStartReturn {
    return Intl.message(
      'Contact us via WhatsApp\n\nto start return',
      name: 'contactWhatsappToStartReturn',
      desc: '',
      args: [],
    );
  }

  /// `Our customer service team will respond and provide the shipping policy within 48 hours.`
  String get customerServiceResponse48Hours {
    return Intl.message(
      'Our customer service team will respond and provide the shipping policy within 48 hours.',
      name: 'customerServiceResponse48Hours',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions for the winter gift offer:`
  String get winterGiftTerms {
    return Intl.message(
      'Terms and conditions for the winter gift offer:',
      name: 'winterGiftTerms',
      desc: '',
      args: [],
    );
  }

  /// `Gifts are granted to all orders while stocks last.`
  String get giftsWhileStocksLast {
    return Intl.message(
      'Gifts are granted to all orders while stocks last.',
      name: 'giftsWhileStocksLast',
      desc: '',
      args: [],
    );
  }

  /// `In case of order return, the included gift must be returned to complete the refund.`
  String get returnGiftWithOrder {
    return Intl.message(
      'In case of order return, the included gift must be returned to complete the refund.',
      name: 'returnGiftWithOrder',
      desc: '',
      args: [],
    );
  }

  /// `Orders up to 199 SAR: One free winter blouse.`
  String get winterGiftTier1 {
    return Intl.message(
      'Orders up to 199 SAR: One free winter blouse.',
      name: 'winterGiftTier1',
      desc: '',
      args: [],
    );
  }

  /// `Orders over 599 SAR: Two winter gifts.`
  String get winterGiftTier2 {
    return Intl.message(
      'Orders over 599 SAR: Two winter gifts.',
      name: 'winterGiftTier2',
      desc: '',
      args: [],
    );
  }

  /// `Terms and conditions for the accessory gift offer:`
  String get accessoryGiftTerms {
    return Intl.message(
      'Terms and conditions for the accessory gift offer:',
      name: 'accessoryGiftTerms',
      desc: '',
      args: [],
    );
  }

  /// `Orders up to 599 SAR: One free piece from Saad.`
  String get accessoryGiftTier1 {
    return Intl.message(
      'Orders up to 599 SAR: One free piece from Saad.',
      name: 'accessoryGiftTier1',
      desc: '',
      args: [],
    );
  }

  /// `Orders of 600 SAR and more: One free piece from Saad + Gift Accessory.`
  String get accessoryGiftTier2 {
    return Intl.message(
      'Orders of 600 SAR and more: One free piece from Saad + Gift Accessory.',
      name: 'accessoryGiftTier2',
      desc: '',
      args: [],
    );
  }

  /// `If the customer's address is outside the shipping company's delivery area, the shipment will be directed to the nearest branch of the company in the customer's area, where the customer can collect the shipment directly from the designated office.`
  String get deliveryOutsideAreaDesc {
    return Intl.message(
      'If the customer\'s address is outside the shipping company\'s delivery area, the shipment will be directed to the nearest branch of the company in the customer\'s area, where the customer can collect the shipment directly from the designated office.',
      name: 'deliveryOutsideAreaDesc',
      desc: '',
      args: [],
    );
  }

  /// `Delivery duration within\nKingdom cities`
  String get localDeliveryDurationTitle {
    return Intl.message(
      'Delivery duration within\nKingdom cities',
      name: 'localDeliveryDurationTitle',
      desc: '',
      args: [],
    );
  }

  /// `From 4 to 7 working days`
  String get localDeliveryTime {
    return Intl.message(
      'From 4 to 7 working days',
      name: 'localDeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Companies: Aramex -\nSMSA`
  String get localShippingCompanies {
    return Intl.message(
      'Shipping Companies: Aramex -\nSMSA',
      name: 'localShippingCompanies',
      desc: '',
      args: [],
    );
  }

  /// `International Delivery\nDuration`
  String get intlDeliveryDurationTitle {
    return Intl.message(
      'International Delivery\nDuration',
      name: 'intlDeliveryDurationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Takes 10 to 15 working days`
  String get intlDeliveryTime {
    return Intl.message(
      'Takes 10 to 15 working days',
      name: 'intlDeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Company: Aramex`
  String get intlShippingCompany {
    return Intl.message(
      'Shipping Company: Aramex',
      name: 'intlShippingCompany',
      desc: '',
      args: [],
    );
  }

  /// `No blog posts found at the moment`
  String get noBlogPostsFound {
    return Intl.message(
      'No blog posts found at the moment',
      name: 'noBlogPostsFound',
      desc: '',
      args: [],
    );
  }

  /// `Sad VIP\nPoints`
  String get sadVipPointsTitle {
    return Intl.message(
      'Sad VIP\nPoints',
      name: 'sadVipPointsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Collect points with every order and redeem them as a discount on your next purchases easily — shop starting from 1 SAR`
  String get collectPointsDesc {
    return Intl.message(
      'Collect points with every order and redeem them as a discount on your next purchases easily — shop starting from 1 SAR',
      name: 'collectPointsDesc',
      desc: '',
      args: [],
    );
  }

  /// `You earn 1 point. To benefit from rewards and discounts, you must have 500 points or more in your account`
  String get earn1PointDesc {
    return Intl.message(
      'You earn 1 point. To benefit from rewards and discounts, you must have 500 points or more in your account',
      name: 'earn1PointDesc',
      desc: '',
      args: [],
    );
  }

  /// `500 points = 50 SAR discount, 1000 points = 100 SAR discount`
  String get pointsToDiscountDesc {
    return Intl.message(
      '500 points = 50 SAR discount, 1000 points = 100 SAR discount',
      name: 'pointsToDiscountDesc',
      desc: '',
      args: [],
    );
  }

  /// `Receive Points`
  String get receivePoints {
    return Intl.message(
      'Receive Points',
      name: 'receivePoints',
      desc: '',
      args: [],
    );
  }

  /// `Ways to Earn Points`
  String get waysToEarnPoints {
    return Intl.message(
      'Ways to Earn Points',
      name: 'waysToEarnPoints',
      desc: '',
      args: [],
    );
  }

  /// `1 Point`
  String get onePoint {
    return Intl.message('1 Point', name: 'onePoint', desc: '', args: []);
  }

  /// `Shop Now`
  String get shopNow {
    return Intl.message('Shop Now', name: 'shopNow', desc: '', args: []);
  }

  /// `Order from Store`
  String get orderFromStore {
    return Intl.message(
      'Order from Store',
      name: 'orderFromStore',
      desc: '',
      args: [],
    );
  }

  /// `100 Points`
  String get hundredPoints {
    return Intl.message(
      '100 Points',
      name: 'hundredPoints',
      desc: '',
      args: [],
    );
  }

  /// `Rate Your Order`
  String get rateYourOrder {
    return Intl.message(
      'Rate Your Order',
      name: 'rateYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Rate Order`
  String get rateOrderBtn {
    return Intl.message('Rate Order', name: 'rateOrderBtn', desc: '', args: []);
  }

  /// `25 Points`
  String get twentyFivePoints {
    return Intl.message(
      '25 Points',
      name: 'twentyFivePoints',
      desc: '',
      args: [],
    );
  }

  /// `Invite Your Friends`
  String get inviteFriends {
    return Intl.message(
      'Invite Your Friends',
      name: 'inviteFriends',
      desc: '',
      args: [],
    );
  }

  /// `Discounts`
  String get discounts {
    return Intl.message('Discounts', name: 'discounts', desc: '', args: []);
  }

  /// `1000 Points`
  String get thousandPoints {
    return Intl.message(
      '1000 Points',
      name: 'thousandPoints',
      desc: '',
      args: [],
    );
  }

  /// `100 SAR`
  String get hundredSar {
    return Intl.message('100 SAR', name: 'hundredSar', desc: '', args: []);
  }

  /// `500 Points`
  String get fiveHundredPoints {
    return Intl.message(
      '500 Points',
      name: 'fiveHundredPoints',
      desc: '',
      args: [],
    );
  }

  /// `50 SAR`
  String get fiftySar {
    return Intl.message('50 SAR', name: 'fiftySar', desc: '', args: []);
  }

  /// `{discount} Discount Coupon`
  String discountCouponStr(Object discount) {
    return Intl.message(
      '$discount Discount Coupon',
      name: 'discountCouponStr',
      desc: '',
      args: [discount],
    );
  }

  /// `SAR {amount} Discount Code`
  String discountCodeStr(Object amount) {
    return Intl.message(
      'SAR $amount Discount Code',
      name: 'discountCodeStr',
      desc: '',
      args: [amount],
    );
  }

  /// `صاد`
  String get saadBrandAr {
    return Intl.message('صاد', name: 'saadBrandAr', desc: '', args: []);
  }

  /// `SAAD`
  String get saadBrandEn {
    return Intl.message('SAAD', name: 'saadBrandEn', desc: '', args: []);
  }

  /// `Casual`
  String get tagCasual {
    return Intl.message('Casual', name: 'tagCasual', desc: '', args: []);
  }

  /// `Evening`
  String get tagEvening {
    return Intl.message('Evening', name: 'tagEvening', desc: '', args: []);
  }

  /// `Silk`
  String get tagSilk {
    return Intl.message('Silk', name: 'tagSilk', desc: '', args: []);
  }

  /// `Men`
  String get tagMen {
    return Intl.message('Men', name: 'tagMen', desc: '', args: []);
  }

  /// `Bags`
  String get tagBags {
    return Intl.message('Bags', name: 'tagBags', desc: '', args: []);
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `Unavailable`
  String get unavailable {
    return Intl.message('Unavailable', name: 'unavailable', desc: '', args: []);
  }

  /// `Including VAT`
  String get includingVat {
    return Intl.message(
      'Including VAT',
      name: 'includingVat',
      desc: '',
      args: [],
    );
  }

  /// `Product Number`
  String get productNumber {
    return Intl.message(
      'Product Number',
      name: 'productNumber',
      desc: '',
      args: [],
    );
  }

  /// `Cotton`
  String get tagCotton {
    return Intl.message('Cotton', name: 'tagCotton', desc: '', args: []);
  }

  /// `Wool`
  String get tagWool {
    return Intl.message('Wool', name: 'tagWool', desc: '', args: []);
  }

  /// `Women`
  String get tagWomen {
    return Intl.message('Women', name: 'tagWomen', desc: '', args: []);
  }

  /// `Kids`
  String get tagKids {
    return Intl.message('Kids', name: 'tagKids', desc: '', args: []);
  }

  /// `Wallets`
  String get tagWallets {
    return Intl.message('Wallets', name: 'tagWallets', desc: '', args: []);
  }

  /// `Accessories`
  String get tagAccessories {
    return Intl.message(
      'Accessories',
      name: 'tagAccessories',
      desc: '',
      args: [],
    );
  }

  /// `Umrah`
  String get tagUmrah {
    return Intl.message('Umrah', name: 'tagUmrah', desc: '', args: []);
  }

  /// `Active`
  String get tagActive {
    return Intl.message('Active', name: 'tagActive', desc: '', args: []);
  }

  /// `Past`
  String get tagPast {
    return Intl.message('Past', name: 'tagPast', desc: '', args: []);
  }

  /// `Upcoming`
  String get tagUpcoming {
    return Intl.message('Upcoming', name: 'tagUpcoming', desc: '', args: []);
  }

  /// `Material`
  String get detailMaterial {
    return Intl.message('Material', name: 'detailMaterial', desc: '', args: []);
  }

  /// `Color`
  String get detailColor {
    return Intl.message('Color', name: 'detailColor', desc: '', args: []);
  }

  /// `Size`
  String get detailSize {
    return Intl.message('Size', name: 'detailSize', desc: '', args: []);
  }

  /// `Care`
  String get detailCare {
    return Intl.message('Care', name: 'detailCare', desc: '', args: []);
  }

  /// `Origin`
  String get detailOrigin {
    return Intl.message('Origin', name: 'detailOrigin', desc: '', args: []);
  }

  /// `Premium Cotton Blend`
  String get valPremiumCottonBlend {
    return Intl.message(
      'Premium Cotton Blend',
      name: 'valPremiumCottonBlend',
      desc: '',
      args: [],
    );
  }

  /// `Black with Gold Embroidery`
  String get valBlackGoldEmbroidery {
    return Intl.message(
      'Black with Gold Embroidery',
      name: 'valBlackGoldEmbroidery',
      desc: '',
      args: [],
    );
  }

  /// `One Size (Adjustable)`
  String get valOneSizeAdjustable {
    return Intl.message(
      'One Size (Adjustable)',
      name: 'valOneSizeAdjustable',
      desc: '',
      args: [],
    );
  }

  /// `Hand Wash Only`
  String get valHandWashOnly {
    return Intl.message(
      'Hand Wash Only',
      name: 'valHandWashOnly',
      desc: '',
      args: [],
    );
  }

  /// `Made in Saudi Arabia`
  String get valMadeInKsa {
    return Intl.message(
      'Made in Saudi Arabia',
      name: 'valMadeInKsa',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
