---
name: Soft Matter Dynamics
colors:
  surface: '#fbf8ff'
  surface-dim: '#d5d8f9'
  surface-bright: '#fbf8ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f4f2ff'
  surface-container: '#ececff'
  surface-container-high: '#e5e6ff'
  surface-container-highest: '#dee0ff'
  on-surface: '#161a32'
  on-surface-variant: '#42474f'
  inverse-surface: '#2b2f48'
  inverse-on-surface: '#f0efff'
  outline: '#727780'
  outline-variant: '#c2c7d0'
  surface-tint: '#2f6192'
  primary: '#2f6192'
  on-primary: '#ffffff'
  primary-container: '#6c9bcf'
  on-primary-container: '#003256'
  inverse-primary: '#9dcaff'
  secondary: '#006c4b'
  on-secondary: '#ffffff'
  secondary-container: '#8af8c5'
  on-secondary-container: '#007350'
  tertiary: '#7f5604'
  on-tertiary: '#ffffff'
  tertiary-container: '#c08f3e'
  on-tertiary-container: '#432b00'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d1e4ff'
  primary-fixed-dim: '#9dcaff'
  on-primary-fixed: '#001d35'
  on-primary-fixed-variant: '#0d4978'
  secondary-fixed: '#8af8c5'
  secondary-fixed-dim: '#6ddbaa'
  on-secondary-fixed: '#002114'
  on-secondary-fixed-variant: '#005137'
  tertiary-fixed: '#ffddaf'
  tertiary-fixed-dim: '#f4bd67'
  on-tertiary-fixed: '#281800'
  on-tertiary-fixed-variant: '#614000'
  background: '#fbf8ff'
  on-background: '#161a32'
  surface-variant: '#dee0ff'
typography:
  display:
    fontFamily: Nunito Sans
    fontSize: 40px
    fontWeight: '800'
    lineHeight: 48px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Nunito Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Nunito Sans
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
  headline-md:
    fontFamily: Nunito Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  title-lg:
    fontFamily: Nunito Sans
    fontSize: 20px
    fontWeight: '600'
    lineHeight: 28px
  body-lg:
    fontFamily: Nunito Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 26px
  body-md:
    fontFamily: Nunito Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Nunito Sans
    fontSize: 14px
    fontWeight: '700'
    lineHeight: 20px
    letterSpacing: 0.01em
  label-sm:
    fontFamily: Nunito Sans
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
rounded:
  sm: 0.5rem
  DEFAULT: 1rem
  md: 1.5rem
  lg: 2rem
  xl: 3rem
  full: 9999px
spacing:
  unit: 4px
  xs: 8px
  sm: 12px
  md: 20px
  lg: 32px
  xl: 48px
  container-padding: 24px
  gutter: 20px
---

## Brand & Style

The design system is centered around the concept of "Soft Clay UI"—a tactile, approachable, and highly organic visual language. It targets users seeking a stress-free financial experience, moving away from the cold, rigid structures of traditional banking toward a playful, squishy, and friendly interface.

The aesthetic utilizes **Claymorphism**, characterized by:
- **Depth through multi-layered shadows:** Combining outer drop shadows with internal highlights to simulate volume.
- **Inflated Geometries:** Every element appears pressurized and soft, like molded clay.
- **Friendly Professionalism:** While the visuals are playful, the underlying logic remains grounded in FinTech reliability through clear information hierarchy.
- **Tactile Feedback:** Interactions should feel physical, utilizing inset shadows on press to simulate material displacement.

## Colors

The palette is anchored in desaturated, soft pastels that reinforce the clay-like texture. 

- **Primary (Soft Blue Clay):** Used for main actions, high-level navigation, and branding elements.
- **Secondary (Soft Green Clay):** Reserved for positive financial indicators, success states, and secondary actions.
- **Accent (Soft Coral Clay):** Targeted for rewards, special offers, and attention-grabbing UI micro-interactions.
- **Background:** A warm off-white (#F0EDE8) provides a soft base that prevents the white internal highlights of the clay elements from disappearing.
- **Neutrals:** Used sparingly for text and icons to maintain high legibility without introducing harsh blacks.

## Typography

This design system uses **Nunito Sans** for its rounded terminals and friendly character, which perfectly complements the clay-like UI components. 

- **Weights:** Use Bold (700) or ExtraBold (800) for headlines to maintain visual weight against "inflated" UI elements. Regular (400) is used for body text to ensure readability.
- **Scaling:** Headlines utilize tight tracking (-0.02em) to feel more cohesive and punchy.
- **Accessibility:** Given the high-depth styling of the containers, text must maintain high contrast against the pastel backgrounds. Avoid using light weights (300 or below).

## Layout & Spacing

The layout philosophy follows a **fluid-to-fixed** model. On mobile, elements use a single-column fluid layout with generous 24px side margins. On desktop, content is contained within a 1200px max-width centered grid.

- **Rhythm:** A 4px baseline grid is used, but component spacing is predominantly scaled in increments of 8px and 20px to create "room to breathe."
- **Generosity:** Because claymorphic elements occupy more visual volume due to their shadows, padding inside cards and containers must be large (minimum 20px) to prevent the content from feeling cramped.
- **Negative Space:** High amounts of whitespace are required to distinguish between different "blobs" of information.

## Elevation & Depth

Depth is the defining characteristic of this design system. It is achieved through a specific three-part shadow technique:

1.  **Outer Shadow:** A bottom-right drop shadow using a muted blue-grey tint `rgba(163, 177, 198, 0.4)` with a 15px-20px blur. This lifts the element off the background.
2.  **Inner Highlight:** A top-left inner shadow/glow using `rgba(255, 255, 255, 0.6)` with a 10px blur. This creates the "inflated" 3D look.
3.  **Secondary Inner Shadow:** A subtle bottom-right inner shadow using a darker version of the element’s own color at low opacity to provide structural definition.

**Elevation Tiers:**
- **Level 1 (Subtle):** Low-profile elements like input fields or toggle tracks.
- **Level 2 (Standard):** Most cards, action buttons, and navigation bars.
- **Level 3 (High):** Modals, bottom sheets, and floating action buttons—these feature larger blur radii and higher offsets.

## Shapes

The shape language is strictly **extra-rounded**. 
- **Base Components:** Input fields, list items, and standard containers use a `24px` radius.
- **Interactive Elements:** Buttons and tags use a full pill-shape (radius `999px`) to maximize the "squishy" tactile feel.
- **Large Containers:** Main dashboard cards and bottom sheets use a `32px` radius.
- **Prohibition:** Under no circumstances should sharp corners (0-8px) be used, as they break the material metaphor of soft clay.

## Components

### Buttons
Primary buttons are pill-shaped, using the Primary Soft Blue. They feature a prominent white inner highlight on the top-left. On `:hover`, the outer shadow blur increases. On `:active` (press), the outer shadow disappears and is replaced by a small `inset` shadow `rgba(0,0,0,0.1)` to simulate the button being pressed into a soft surface.

### Cards
Cards must use the Level 2 elevation. Backgrounds should be white or very light tints of the primary/secondary colors. Internal padding is strictly 24px.

### Input Fields
Inputs appear "sunken" into the clay. This is achieved by reversing the shadow logic: use a top-left dark inset shadow and a bottom-right light inset highlight. The background of the input should be slightly darker than the surface it sits on.

### Chips & Tags
Small pill-shaped elements used for categories. They use the same claymorphic depth as buttons but scaled down (subtle inner highlights).

### Progress Bars
The track is "sunken" (inset shadows), while the progress indicator is "inflated" (outer shadows and inner highlights), making the progress bar look like a physical object sliding inside a groove.

### Navigation Bar
A floating Level 3 container at the bottom of the screen with extreme rounded corners (32px), detached from the screen edges to emphasize its object-like quality.