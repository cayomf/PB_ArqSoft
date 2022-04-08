import 'package:flutter/material.dart';

enum SideHorizontalStack { right, left, all }

enum SideVerticalStack { top, bottom, all }

class StackTheme {
  /// Margin com 8px (stack-horizontal-100)
  static EdgeInsets Function(SideHorizontalStack side) horizontal100 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 8);
  
  /// Margin horizontal com 12px (stack-horizontal-150)
  static EdgeInsets Function(SideHorizontalStack side) horizontal150 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 12);
  
  /// Margin horizontal com 16px (stack-horizontal-200)
  static EdgeInsets Function(SideHorizontalStack side) horizontal200 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 16);
  
  /// Margin horizontal com 20px (stack-horizontal-300)
  static EdgeInsets Function(SideHorizontalStack side) horizontal300 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 20);

  /// Margin horizontal com 24px (stack-horizontal-400)
  static EdgeInsets Function(SideHorizontalStack side) horizontal400 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 24);

  /// Margin horizontal com 32px (stack-horizontal-500)
  static EdgeInsets Function(SideHorizontalStack side) horizontal500 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 32);

  /// Margin horizontal com 40px (stack-horizontal-600)
  static EdgeInsets Function(SideHorizontalStack side) horizontal600 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 40);

  /// Margin horizontal com 48px (stack-horizontal-700)
  static EdgeInsets Function(SideHorizontalStack side) horizontal700 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 48);

  /// Margin horizontal com 56px (stack-horizontal-800)
  static EdgeInsets Function(SideHorizontalStack side) horizontal800 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 56);

  /// Margin horizontal com 64px (stack-horizontal-900)
  static EdgeInsets Function(SideHorizontalStack side) horizontal900 = (SideHorizontalStack side) => _horizontalStack(side: side, value: 64);

  /// Margin vertical com 8px (stack-vertical-100) 
  static EdgeInsets Function(SideVerticalStack side) vertical100 = (SideVerticalStack side) => _verticalStack(side: side, value: 8);

  /// Margin vertical com 12px (stack-vertical-150) 
  static EdgeInsets Function(SideVerticalStack side) vertical150 = (SideVerticalStack side) => _verticalStack(side: side, value: 12);

  /// Margin vertical com 16px (stack-vertical-200) 
  static EdgeInsets Function(SideVerticalStack side) vertical200 = (SideVerticalStack side) => _verticalStack(side: side, value: 16);

  /// Margin vertical com 20px (stack-vertical-300) 
  static EdgeInsets Function(SideVerticalStack side) vertical300 = (SideVerticalStack side) => _verticalStack(side: side, value: 20);

  /// Margin vertical com 24px (stack-vertical-400) 
  static EdgeInsets Function(SideVerticalStack side) vertical400 = (SideVerticalStack side) => _verticalStack(side: side, value: 24);

  /// Margin vertical com 32px (stack-vertical-500) 
  static EdgeInsets Function(SideVerticalStack side) vertical500 = (SideVerticalStack side) => _verticalStack(side: side, value: 32);

  /// Margin vertical com 40px (stack-vertical-600) 
  static EdgeInsets Function(SideVerticalStack side) vertical600 = (SideVerticalStack side) => _verticalStack(side: side, value: 40);

  /// Margin vertical com 48px (stack-vertical-700) 
  static EdgeInsets Function(SideVerticalStack side) vertical700 = (SideVerticalStack side) => _verticalStack(side: side, value: 48);

  /// Margin vertical com 56px (stack-vertical-800) 
  static EdgeInsets Function(SideVerticalStack side) vertical800 = (SideVerticalStack side) => _verticalStack(side: side, value: 56);

  /// Margin vertical com 64px (stack-vertical-900) 
  static EdgeInsets Function(SideVerticalStack side) vertical900 = (SideVerticalStack side) => _verticalStack(side: side, value: 64);

  static EdgeInsets _horizontalStack({required SideHorizontalStack side, required double value}) {
    if (side == SideHorizontalStack.all) {
      return EdgeInsets.symmetric(horizontal: value);
    }
    return side == SideHorizontalStack.left ? EdgeInsets.only(left: value) : EdgeInsets.only(right: value);
  }

  static EdgeInsets _verticalStack({required SideVerticalStack side, required double value}) {
    if (side == SideVerticalStack.all) {
      return EdgeInsets.symmetric(vertical: value);
    }
    return side == SideVerticalStack.bottom ? EdgeInsets.only(bottom: value) : EdgeInsets.only(top: value);
  }

}