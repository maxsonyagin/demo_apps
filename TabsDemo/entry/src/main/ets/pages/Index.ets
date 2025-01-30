import router from '@ohos.router'
import {
  AnimationDurationProperty,
  AnimationModeProperty,
  BarBackgroundBlurStyleProperty,
  BarBackgroundColorProperty,
  BarGridAlignProperty,
  BarHeightProperty,
  BarModeProperty,
  BarOverlapProperty,
  BarPositionProperty,
  BarWidthProperty,
  DividerColorProperty,
  DividerEndMarginProperty,
  DividerProperty,
  DividerStartMarginProperty,
  DividerStrokeWidthProperty,
  EdgeEffectProperty,
  FadingEdgeProperty,
  GutterProperty,
  LgProperty,
  MarginProperty,
  MdProperty,
  ScrollableBarModeOptionsMarginProperty,
  ScrollableBarModeOptionsNonScrollableLayoutStyleProperty,
  ScrollableProperty,
  SmProperty,
  VerticalProperty } from '../utils/vars'

AppStorage.setOrCreate(VerticalProperty, "false")
AppStorage.setOrCreate(BarPositionProperty, "End")
AppStorage.setOrCreate(ScrollableProperty, "true")
AppStorage.setOrCreate(BarModeProperty, "Fixed")
AppStorage.setOrCreate(ScrollableBarModeOptionsMarginProperty, "0")
AppStorage.setOrCreate(ScrollableBarModeOptionsNonScrollableLayoutStyleProperty, "ALWAYS_CENTER")
AppStorage.setOrCreate(BarWidthProperty, "380")
AppStorage.setOrCreate(BarHeightProperty, "52")
AppStorage.setOrCreate(AnimationDurationProperty, "300")
AppStorage.setOrCreate(AnimationModeProperty, "CONTENT_FIRST")
AppStorage.setOrCreate(DividerProperty, false)
AppStorage.setOrCreate(DividerStrokeWidthProperty, "3")
AppStorage.setOrCreate(DividerColorProperty, "#33182431")
AppStorage.setOrCreate(DividerStartMarginProperty, "0")
AppStorage.setOrCreate(DividerEndMarginProperty,"0")
AppStorage.setOrCreate(FadingEdgeProperty, true)
AppStorage.setOrCreate(BarOverlapProperty, true)
AppStorage.setOrCreate(BarBackgroundColorProperty, "#00FFFFFF")
AppStorage.setOrCreate(BarBackgroundBlurStyleProperty, "NONE")
AppStorage.setOrCreate(BarGridAlignProperty, false)
AppStorage.setOrCreate(MarginProperty, "24")
AppStorage.setOrCreate(GutterProperty, "24")
AppStorage.setOrCreate(SmProperty, "-1")
AppStorage.setOrCreate(MdProperty, "-1")
AppStorage.setOrCreate(LgProperty, "-1")
AppStorage.setOrCreate(EdgeEffectProperty, "Spring")

@Entry
@Component
struct Index {
  @StorageLink(VerticalProperty) VerticalAttr: string | undefined = "false"
  @StorageLink(BarPositionProperty) BarPositionAttr: string | undefined = "End"
  @StorageLink(ScrollableProperty) ScrollableAttr: string | undefined = "true"
  @StorageLink(BarModeProperty) BarModeAttr: string | undefined = "Fixed"
  @StorageLink(ScrollableBarModeOptionsMarginProperty) ScrollableBarModeOptionsMarginAttr: string | undefined = "0"
  @StorageLink(ScrollableBarModeOptionsNonScrollableLayoutStyleProperty) ScrollableBarModeOptionsNonScrollableLayoutStyleAttr: string | undefined = "ALWAYS_CENTER"
  @StorageLink(BarWidthProperty) BarWidthAttr: string | undefined = "380"
  @StorageLink(BarHeightProperty) BarHeightAttr: string | undefined = "52"
  @StorageLink(AnimationDurationProperty) AnimationDurationAttr: string | undefined = "300"
  @StorageLink(AnimationModeProperty) AnimationModeAttr: string | undefined = "CONTENT_FIRST"
  @StorageLink(DividerProperty) DividerAttr: boolean | undefined = false
  @StorageLink(DividerStrokeWidthProperty) DividerStrokeWidthAttr: string = "3"
  @StorageLink(DividerColorProperty) DividerColorAttr: string  = "#33182431"
  @StorageLink(DividerStartMarginProperty) DividerStartMarginAttr: string = "0"
  @StorageLink(DividerEndMarginProperty) DividerEndMarginAttr: string = "0"
  @StorageLink(FadingEdgeProperty) FadingEdgeAttr: boolean | undefined = true
  @StorageLink(BarOverlapProperty) BarOverlapAttr: boolean | undefined = true
  @StorageLink(BarBackgroundColorProperty) BarBackgroundColorAttr: string | undefined = "#00FFFFFF"
  @StorageLink(BarBackgroundBlurStyleProperty) BarBackgroundBlurStyleAttr: string = "NONE"
  @StorageLink(BarGridAlignProperty) BarGridAlignAttr: boolean | undefined = false
  @StorageLink(MarginProperty) MarginAttr: string | undefined = "24"
  @StorageLink(GutterProperty) GutterAttr: string | undefined = "24"
  @StorageLink(SmProperty) SmAttr: string | undefined = "-1"
  @StorageLink(MdProperty) MdAttr: string | undefined = "-1"
  @StorageLink(LgProperty) LgAttr: string | undefined = "-1"
  @StorageLink(EdgeEffectProperty) EdgeEffectAttr: string | undefined = "Spring"


  BarBackgroundBlurStyles: string[] = ["Thin", "Regular", "Thick", "BACKGROUND_THIN", "BACKGROUND_REGULAR", "BACKGROUND_THICK",
    "BACKGROUND_ULTRA_THICK", "NONE", "COMPONENT_ULTRA_THIN", "COMPONENT_THIN", "COMPONENT_REGULAR", "COMPONENT_THICK",
  "COMPONENT_ULTRA_THICK"]

  getLayoutStyleIndex(): number {
    switch (this.ScrollableBarModeOptionsNonScrollableLayoutStyleAttr) {
      case 'ALWAYS_CENTER':
        return 0;
      case 'ALWAYS_AVERAGE_SPLIT':
        return 1;
      case 'SPACE_BETWEEN_OR_CENTER':
        return 2;
      default:
        return 0; // Default to the first option
    }
  }

  getAnimationModeIndex(): number {
    switch (this.AnimationModeAttr) {
      case 'CONTENT_FIRST':
        return 0;
      case 'ANIMATION_FIRST':
        return 1;
      case 'NO_ANIMATION':
        return 2;
      default:
        return 0; // Default to the first option
    }
  }
  getEdgeEffectIndex(): number {
    switch (this.EdgeEffectAttr) {
      case 'Spring':
        return 0;
      case 'Fade':
        return 1;
      case 'None':
        return 2;
      default:
        return 0; // Default to the first option
    }
  }

  getBarBackgroundBlurStylesIndex(): number {
    const index = this.BarBackgroundBlurStyles.indexOf(this.BarBackgroundBlurStyleAttr);
    return index >= 0 ? index : 0
  }
  build() {
    Column(){
      Text("Select Tabs component page parameters")
      Divider()
        .strokeWidth(2)
        .margin({bottom:'5vp',top:'5vp'})
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
            Column() {
              Text("Vertical")
              Select([{ value: "false" },
                { value: "true" }])
                .selected(this.VerticalAttr === 'true' ? 1 : 0)
                .value(this.VerticalAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.VerticalAttr = text
                })
            }

            Column() {
              Text("BarPosition")
              Select([{ value: "Start" },
                { value: "End" }])
                .selected(this.BarPositionAttr === 'End' ? 1 : 0)
                .value(this.BarPositionAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.BarPositionAttr = text
                })
            }

            Column() {
              Text("Scrollable")
              Select([{ value: "false" },
                { value: "true" }])
                .selected(this.ScrollableAttr === 'true' ? 1 : 0)
                .value(this.ScrollableAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.ScrollableAttr = text
                })
            }

            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("BarMode")
              Select([{ value: "Fixed" },
                { value: "Scrollable" }])
                .selected(this.BarModeAttr === 'Scrollable' ? 1 : 0)
                .value(this.BarModeAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.BarModeAttr = text
                })
            }

            if (this.BarModeAttr == "Scrollable") {
              Column() {
                Text("Margin")
                TextInput({ text: this.ScrollableBarModeOptionsMarginAttr })
                  .onChange((value: string) => {
                    this.ScrollableBarModeOptionsMarginAttr = value
                  })
              }.width("40%")

              Column() {
                Text("LayoutStyle")
                Select([{ value: "ALWAYS_CENTER" },
                  { value: "ALWAYS_AVERAGE_SPLIT" },
                  { value: "SPACE_BETWEEN_OR_CENTER" }])
                  .selected(this.getLayoutStyleIndex())
                  .value(this.ScrollableBarModeOptionsNonScrollableLayoutStyleAttr)
                  .onSelect((index: number, text?: string | undefined) => {
                    this.ScrollableBarModeOptionsNonScrollableLayoutStyleAttr = text
                  })
              }
            }
            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("BarWidth")
              TextInput({ text: this.BarWidthAttr })
                .onChange((value: string) => {
                  this.BarWidthAttr = value
                })
            }.width("40%")

            Column() {
              Text("BarHeight")
              TextInput({ text: this.BarHeightAttr })
                .onChange((value: string) => {
                  this.BarHeightAttr = value
                })
            }.width("40%")

            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("AnimationDuration")
              TextInput({ text: this.AnimationDurationAttr })
                .onChange((value: string) => {
                  this.AnimationDurationAttr = value
                })
            }.width("40%")

            if (this.AnimationDurationAttr != "0") {
              Column() {
                Text("AnimationMode")
                Select([{ value: "CONTENT_FIRST" },
                  { value: "ANIMATION_FIRST" },
                  { value: "NO_ANIMATION" }])
                  .selected(this.getAnimationModeIndex())
                  .value(this.AnimationModeAttr)
                  .onSelect((index: number, text?: string | undefined) => {
                    this.AnimationModeAttr = text
                  })
              }
            }
            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("Divider")
              Toggle({ type: ToggleType.Switch, isOn: this.DividerAttr })
                .onChange((isOn: boolean) => {
                  this.DividerAttr = isOn
                })
            }

            if (this.DividerAttr) {
              Column() {
                Text("StrokeWidth")
                TextInput({ text: this.DividerStrokeWidthAttr })
                  .onChange((value: string) => {
                    this.DividerStrokeWidthAttr = value
                  })
              }.width("40%")

              Column() {
                Text("Color")
                Select([{ value: "#33182431" },
                  { value: "#FF0000" }])
                  .selected(this.DividerColorAttr === '#33182431' ? 0 : 1)
                  .value(this.DividerColorAttr)
                  .onSelect((index: number, text?: string) => {
                    if (text) {
                      this.DividerColorAttr = text
                    }
                  })
              }.width("40%")

              Column() {
                Text("StartMargin")
                TextInput({ text: this.DividerStartMarginAttr })
                  .onChange((value: string) => {
                    this.DividerStartMarginAttr = value
                  })
              }.width("40%")

              Column() {
                Text("EndMargin")
                TextInput({ text: this.DividerEndMarginAttr })
                  .onChange((value: string) => {
                    this.DividerEndMarginAttr = value
                  })
              }.width("40%")
            }
            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("FadingEdge")
              Toggle({ type: ToggleType.Switch, isOn: this.FadingEdgeAttr })
                .onChange((isOn: boolean) => {
                  this.FadingEdgeAttr = isOn
                })
            }

            Column() {
              Text("BarOverlap")
              Toggle({ type: ToggleType.Switch, isOn: this.BarOverlapAttr })
                .onChange((isOn: boolean) => {
                  this.BarOverlapAttr = isOn
                })
            }

            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("BarBackgroundColor")
              Select([{ value: "#00FFFFFF" },
                { value: "#88888888" }])
                .selected(this.BarBackgroundColorAttr === "#00FFFFFF" ? 0 : 1)
                .value(this.BarBackgroundColorAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.BarBackgroundColorAttr = text
                })
            }

            Column() {
              Text("BarBackgroundBlurStyle")
              Select([{ value: this.BarBackgroundBlurStyles[0] },
                { value: this.BarBackgroundBlurStyles[1] },
                { value: this.BarBackgroundBlurStyles[2] },
                { value: this.BarBackgroundBlurStyles[3] },
                { value: this.BarBackgroundBlurStyles[4] },
                { value: this.BarBackgroundBlurStyles[5] },
                { value: this.BarBackgroundBlurStyles[6] },
                { value: this.BarBackgroundBlurStyles[7] },
                { value: this.BarBackgroundBlurStyles[8] },
                { value: this.BarBackgroundBlurStyles[9] },
                { value: this.BarBackgroundBlurStyles[10] },
                { value: this.BarBackgroundBlurStyles[11] },
                { value: this.BarBackgroundBlurStyles[12] }])
                .selected(this.getBarBackgroundBlurStylesIndex())
                .value(this.BarBackgroundBlurStyleAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  if (text) {
                    this.BarBackgroundBlurStyleAttr = text
                  }
                })
            }

            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("BarGridAlign")
              Toggle({ type: ToggleType.Switch, isOn: this.BarGridAlignAttr })
                .onChange((isOn: boolean) => {
                  this.BarGridAlignAttr = isOn
                })
            }.width("40%")

            if (this.BarGridAlignAttr) {
              Column() {
                Text("Margin")
                TextInput({ text: this.MarginAttr })
                  .onChange((value: string) => {
                    this.MarginAttr = value
                  })
              }.width("40%")

              Column() {
                Text("Gutter")
                TextInput({ text: this.GutterAttr })
                  .onChange((value: string) => {
                    this.GutterAttr = value
                  })
              }.width("40%")

              Column() {
                Text("Sm")
                TextInput({ text: this.SmAttr })
                  .onChange((value: string) => {
                    this.SmAttr = value
                  })
              }.width("40%")

              Column() {
                Text("Md")
                TextInput({ text: this.MdAttr })
                  .onChange((value: string) => {
                    this.MdAttr = value
                  })
              }.width("40%")

              Column() {
                Text("Lg")
                TextInput({ text: this.LgAttr })
                  .onChange((value: string) => {
                    this.LgAttr = value
                  })
              }.width("40%")
            }
            Divider()
              .strokeWidth(2)
              .margin({ bottom: '5vp', top: '5vp' })
            Column() {
              Text("EdgeEffect")
              Select([{ value: "Spring" },
                { value: "Fade" },
                { value: "None" }])
                .selected(this.getEdgeEffectIndex())
                .value(this.EdgeEffectAttr)
                .onSelect((index: number, text?: string | undefined) => {
                  this.EdgeEffectAttr = text
                })
            }.width("40%")
          }
          Divider()
            .strokeWidth(2)
            .margin({ bottom: '5vp', top: '5vp' })
          Button("Tabs")
            .onClick(() => {
              router.pushUrl({ url: "pages/TabsPage" })
            })
        }
      }
    }
  }
}