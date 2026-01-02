### Brown Coffee ☕
A High-Fidelity Coffee Ordering Interface built with Flutter, focusing on precise UI implementation and fluid state transitions.

### 📌 Project Overview
The Brown Coffee app is a premium mobile interface designed to showcase the marriage between high-end design and functional code. The project involved translating a complex, multi-layered Figma design into a performant Flutter application, ensuring that shadows, gradients, and micro-interactions remained faithful to the original vision.

### 🚀 Key Features
Dynamic Product Discovery: A visually rich browsing experience for various coffee blends and beverages.

Custom Selection Logic: Interactive elements for choosing coffee sizes, milk alternatives, and sugar levels.

Figma-to-Code Precision: Every margin, font-weight, and color hex code was meticulously mapped from the design file to custom Flutter widgets.

Responsive Layouts: Optimized for various screen sizes to maintain visual hierarchy across different mobile devices.

### 🛠 Technical Challenges & Solutions
Translating Complex Aesthetics:

Challenge: The design used specific "soft-UI" shadows and overlapping elements that standard Material widgets don't support out of the box.

Solution: Built custom DecoratedBox and Stack configurations to achieve the exact depth and layering required by the design.

State Management for Orders:

Challenge: Handling the temporary state of a coffee order (customizations) before it hits the cart.

Solution: Implemented a clean state management flow using GetX to ensure that UI components updated instantly as the user toggled items.

### 💻 Tech Stack
Framework: Flutter

Language: Dart

State Management: GetX

Design Source: Figma

### 📈 Learning Journey
This project was a deep dive into the Flutter Rendering Pipeline. It challenged me to:

Move beyond standard component libraries to build bespoke UI elements.

Understand the performance implications of complex gradients and blurs.

Collaborate effectively with designers by speaking the language of "pixels and points😁"
