# 📱 responsive_helper

**ResponsiveHelper** is a lightweight Flutter utility package that helps developers scale UI elements proportionally based on screen size and optional user-defined scaling preferences.

This is especially useful when your Figma designs are based on a fixed reference resolution (e.g., 1280×800), and you want to maintain visual consistency across devices without manually calculating scale values.

---

## 🚀 Why use this?

Designs in tools like Figma are usually made for a single screen size. For example:

- A container might be `width: 100`, `height: 200`, `fontSize: 14`
- But on smaller or larger devices, those values need to adapt to maintain proportional UI

This package does the heavy lifting. Just give it your Figma reference dimensions once, and it will scale everything for you — width, height, font sizes, paddings, margins, etc.

---

## 🧠 Features

- ✅ Scale widths, heights, and font sizes based on device screen dimensions
- ✅ Consistent adaptation of Figma-designed UIs to real devices
- ✅ Supports user-defined global scale factor for accessibility (e.g., zoomed UI)
- ✅ Easy-to-use `BuildContext` extension methods
- ✅ Configurable reference width and height (default: `1280 x 800`)

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  responsive_helper: ^1.0.0



## ⚙️ Initialization

Call `ResponsiveHelper.init(context)` as early as possible in your app, **after the first layout has been built** — usually in your first screen (like `SplashScreen`, `HomeScreen`, or `LoginScreen`).

> ❗️Do **not** call this inside `main()` or before `MediaQuery` is available. It must be called after the widget tree has been rendered.

### ✅ Example: Using `initState()` with `WidgetsBinding.instance.addPostFrameCallback`

```dart
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ResponsiveHelper.init(context); // Initialize with default or custom scaling
      setState(() {}); // Optional: if you want to rebuild after scaling is ready
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome!',
          style: TextStyle(fontSize: context.u(16)),
        ),
      ),
    );
  }
}


```dart
await ResponsiveHelper.init(
  context,
  referenceWidth: 1024, // Your Figma base width
  referenceHeight: 768, // Your Figma base height
  loadScale: () => SecureStorageHelper().getSecureValue("scale"), // Optional scaling
);
