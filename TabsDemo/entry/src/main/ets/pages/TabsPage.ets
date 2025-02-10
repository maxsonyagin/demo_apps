import router from '@ohos.router'
import { WaterFlowDataSource } from './WaterFlowDataSource'
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

@Entry
@Component
struct Index {
  @StorageLink(VerticalProperty) VerticalAttr: string | undefined = undefined
  @StorageLink(BarPositionProperty) BarPositionAttr: string | undefined = undefined
  @StorageLink(ScrollableProperty) ScrollableAttr: string | undefined = undefined
  @StorageLink(BarModeProperty) BarModeAttr: string | undefined = undefined
  @StorageLink(ScrollableBarModeOptionsMarginProperty) ScrollableBarModeOptionsMarginAttr: string | undefined = undefined
  @StorageLink(ScrollableBarModeOptionsNonScrollableLayoutStyleProperty) ScrollableBarModeOptionsNonScrollableLayoutStyleAttr: string | undefined = undefined
  @StorageLink(BarWidthProperty) BarWidthAttr: string | undefined = undefined
  @StorageLink(BarHeightProperty) BarHeightAttr: string | undefined = undefined
  @StorageLink(AnimationDurationProperty) AnimationDurationAttr: string | undefined = undefined
  @StorageLink(AnimationModeProperty) AnimationModeAttr: string | undefined = undefined
  @StorageLink(DividerProperty) DividerAttr: boolean | undefined = false
  @StorageLink(DividerStrokeWidthProperty) DividerStrokeWidthAttr: string  = "3"
  @StorageLink(DividerColorProperty) DividerColorAttr: string  = "#33182431"
  @StorageLink(DividerStartMarginProperty) DividerStartMarginAttr: string  = "0"
  @StorageLink(DividerEndMarginProperty) DividerEndMarginAttr: string  = "0"
  @StorageLink(FadingEdgeProperty) FadingEdgeAttr: boolean | undefined = undefined
  @StorageLink(BarOverlapProperty) BarOverlapAttr: boolean | undefined = undefined
  @StorageLink(BarBackgroundColorProperty) BarBackgroundColorAttr: string | undefined = "#00FFFFFF"
  @StorageLink(BarBackgroundBlurStyleProperty) BarBackgroundBlurStyleAttr: string = "NONE"
  @StorageLink(BarGridAlignProperty) BarGridAlignAttr: boolean | undefined = false
  @StorageLink(MarginProperty) MarginAttr: string = "24"
  @StorageLink(GutterProperty) GutterAttr: string = "24"
  @StorageLink(SmProperty) SmAttr: string = "-1"
  @StorageLink(MdProperty) MdAttr: string = "-1"
  @StorageLink(LgProperty) LgAttr: string  = "-1"
  @StorageLink(EdgeEffectProperty) EdgeEffectAttr: string | undefined = undefined

  private arr: number[] = [0, 1, 2, 3, 4, 5]

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  @State selectedIndex: number = 0
  @State minSize: number = 80
  @State maxSize: number = 100
  @State colors: number[] = [0xFFC0CB, 0xDA70D6, 0x6B8E23, 0x6A5ACD, 0x00FFFF, 0x00FF7F]
  dataSource: WaterFlowDataSource = new WaterFlowDataSource()
  private itemWidthArray: number[] = []
  private itemHeightArray: number[] = []
  private controller: TabsController = new TabsController()

  // Set the width and height array of the water flow item.
  setItemSizeArray() {
    for (let i = 0; i < 9; i++) {
      this.itemWidthArray.push(this.maxSize)
      this.itemHeightArray.push(this.maxSize)
    }
  }

  aboutToAppear() {
    this.setItemSizeArray()
  }

  getBarPosition(): BarPosition | undefined {
    switch (this.BarPositionAttr) {
      case 'End':
        return BarPosition.End
      case 'Start':
        return BarPosition.Start
      default:
        return undefined
    }
  }
  getBarMode(): BarMode | undefined {
    switch (this.BarModeAttr) {
      case 'Fixed':
        return BarMode.Fixed
      case 'Scrollable':
        return BarMode.Scrollable
      default:
        return undefined
    }
  }
  getScrollableBarModeOptions():ScrollableBarModeOptions | undefined{
    let options:ScrollableBarModeOptions
    if (this.getBarMode()==BarMode.Fixed){
      return undefined
    }
    let marginVar:Dimension = 0
    if (this.ScrollableBarModeOptionsMarginAttr){
      marginVar = parseInt(this.ScrollableBarModeOptionsMarginAttr)
    }
    let style:LayoutStyle
    switch (this.ScrollableBarModeOptionsNonScrollableLayoutStyleAttr) {
      case 'ALWAYS_CENTER':
        style = LayoutStyle.ALWAYS_CENTER
      case 'ALWAYS_AVERAGE_SPLIT':
        style = LayoutStyle.ALWAYS_AVERAGE_SPLIT
      case 'SPACE_BETWEEN_OR_CENTER':
        style = LayoutStyle.SPACE_BETWEEN_OR_CENTER
      default:
        style = LayoutStyle.ALWAYS_CENTER
    }
    options = {margin:marginVar,nonScrollableLayoutStyle:style}
    return options
  }

  getBarWidth():number| undefined {
    if (this.BarWidthAttr == undefined){
      return undefined
    }
    else {
      return parseInt(this.BarWidthAttr)
    }
  }

  getBarHeight():number| undefined {
    if (this.BarHeightAttr == undefined){
      return undefined
    }
    else {
      return parseInt(this.BarHeightAttr)
    }
  }

  getAnimationDuration():number| undefined {
    if (this.AnimationDurationAttr == undefined){
      return undefined
    }
    else {
      return parseInt(this.AnimationDurationAttr)
    }
  }

  getAnimationMode(): AnimationMode | undefined {
    switch (this.AnimationModeAttr) {
      case 'CONTENT_FIRST':
        return AnimationMode.CONTENT_FIRST
      case 'ACTION_FIRST':
        return AnimationMode.ACTION_FIRST
      case 'NO_ANIMATION':
        return AnimationMode.NO_ANIMATION
      default:
        return undefined
    }
  }
  getDivider():DividerStyle | undefined {
    if (this.DividerAttr == false) {
      return undefined
    }
    else{

      return {
        strokeWidth: this.DividerStrokeWidthAttr,
        color: this.DividerColorAttr,
        startMargin: this.DividerStartMarginAttr,
        endMargin: this.DividerEndMarginAttr
      }
    }
  }

  getBarBackgroundBlurStyle():BlurStyle{
    switch (this.BarBackgroundBlurStyleAttr) {
      case 'Thin':
        return BlurStyle.Thin
      case 'Regular':
        return BlurStyle.Regular
      case 'Thick':
        return BlurStyle.Thick
      case 'BACKGROUND_THIN':
        return BlurStyle.BACKGROUND_THIN
      case 'BACKGROUND_REGULAR':
        return BlurStyle.BACKGROUND_REGULAR
      case 'BACKGROUND_THICK':
        return BlurStyle.BACKGROUND_THICK
      case 'BACKGROUND_ULTRA_THICK':
        return BlurStyle.BACKGROUND_ULTRA_THICK
      case 'NONE':
        return BlurStyle.NONE
      case 'COMPONENT_ULTRA_THIN':
        return BlurStyle.COMPONENT_ULTRA_THIN
      case 'COMPONENT_THIN':
        return BlurStyle.COMPONENT_THIN
      case 'COMPONENT_REGULAR':
        return BlurStyle.COMPONENT_REGULAR
      case 'COMPONENT_THICK':
        return BlurStyle.COMPONENT_THICK
      case 'COMPONENT_ULTRA_THICK':
        return BlurStyle.COMPONENT_ULTRA_THICK
      default:
        return BlurStyle.NONE
    }
  }
  getBarGridAlign(): BarGridColumnOptions | undefined {
    if (this.BarGridAlignAttr==false){
      return undefined
    }
    else{
      return {
        margin: parseInt(this.MarginAttr),
        gutter:parseInt(this.GutterAttr),
        sm:parseInt(this.SmAttr),
        md:parseInt(this.MdAttr),
        lg:parseInt(this.LgAttr),
      }
    }
  }
  getEdgeEffect(): EdgeEffect | undefined {
    switch (this.EdgeEffectAttr) {
      case 'Spring':
        return EdgeEffect.Spring
      case 'Fade':
        return EdgeEffect.Fade
      case 'None':
        return EdgeEffect.None
      default:
        return undefined
    }
  }
  @Builder tabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.selectedIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.selectedIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.selectedIndex === index ? 1 : 0)
    }.width('100%')
  }
  @Builder tabContentBuilder(){
    Scroll(){
      Column(){
        Image($r('app.media.Sample'))
          .width(220).height(220).margin({top:"30vp"})
        Text('FadingEdge: ' + (this.FadingEdgeAttr ? 'true' : 'false'))
        Text('BarOverlap: '+ (this.BarOverlapAttr ? 'true' : 'false'))
        Text('BarBackgroundColor: ' + this.BarBackgroundColorAttr)
        Text('BarBackgroundBlurStyle: ' + this.BarBackgroundBlurStyleAttr)
        Text('EdgeEffect: ' + this.EdgeEffectAttr)
        Image($r('app.media.Sample'))
          .width(220).height(220).margin({bottom: "100vp"})

      }
    }
    .edgeEffect(EdgeEffect.Spring)
    .scrollBar(BarState.Off)
  }

  build() {
    Column(){
      Tabs({ barPosition: this.getBarPosition(), index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column(){
            List({initialIndex: 0 }) {
              ForEach(this.arr, (item: number) => {
                ListItem() {
                  Row(){
                    Text('' + item)
                      .width('40%').height(40).fontSize(16)
                      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(Color.Green)
                    Text('' + item)
                      .width('40%').height(40).fontSize(16)
                      .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(Color.Green)
                      .margin({left:"30vp"})
                  }
                }.margin({bottom:"77vp"})
              }, (item: string) => item)
            }
            .listDirection(Axis.Vertical) // Arrangement direction
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring) // Set the edge scrolling effect to Spring.
          }.width('100%').height('100%')

        }.tabBar(this.tabBuilder(0, 'l1'))

        TabContent() {
          Column(){
            List({ initialIndex: 0 }) {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], (item: number) => {
                ListItem() {
                  Image($r('app.media.Sample'))
                    .width(250).height(150).margin({left:37})
                }.margin({top:"35vp"})
              }, (item: string) => item)
            }.margin({top:"30vp"})
            .listDirection(Axis.Vertical) // Arrangement direction
            .scrollBar(BarState.On)
            .edgeEffect(EdgeEffect.Spring) // Set the edge scrolling effect to Spring.
          }
          .width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(this.tabBuilder(1, 'l2'))

        TabContent() {
          Column(){
            this.tabContentBuilder()
          }.width('100%').height('100%')

        }.tabBar(this.tabBuilder(2, 's1')).backgroundColor('#8000FF')

        TabContent() {
          Column(){
            Scroll(){
              Column(){
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 ,20], (item: number) => {
                    Row(){
                      Text('' + item)
                        .width('40%').height(50).fontSize(16)
                        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(Color.Green)
                      Text('' + item)
                        .width('40%').height(50).fontSize(16)
                        .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(Color.Green)
                        .margin({left:"30vp"})
                    }.margin({top:30})
                }, (item: string) => item)
              }.margin({top:30})
            }
            .edgeEffect(EdgeEffect.Spring)
            .scrollBar(BarState.Off)
          }.width('100%').height('100%').backgroundColor('#E67C92')
        }.tabBar(this.tabBuilder(3, 's2'))
        TabContent() {
          Column(){
            Grid() {
              ForEach(['0', '1', '2'], (day: string) => {
                ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                  GridItem() {
                    Text(day)
                      .fontSize(16)
                      .backgroundColor(0xF9CF93)
                      .width('100%')
                      .height(80)
                      .textAlign(TextAlign.Center)
                  }.margin({bottom:120})
                }, (day: string) => day)
              }, (day: string) => day)
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .columnsGap(10)
            .rowsGap(40)
            .edgeEffect(EdgeEffect.Spring)
            .scrollBar(BarState.Off)
          }.width('100%').height('100%')
        }.tabBar(this.tabBuilder(4, 'g1'))
        TabContent() {
          Column(){
            Grid() {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                  GridItem() {
                    Text(day)
                      .fontSize(16)
                      .backgroundColor(0xF9CF93)
                      .width('100%')
                      .height(80)
                      .textAlign(TextAlign.Center)
                  }.margin({top:120})
                }, (day: string) => day)
              }, (day: string) => day)
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .columnsGap(10)
            .rowsGap(40)
            .edgeEffect(EdgeEffect.Spring)
            .scrollBar(BarState.On)
          }.width('100%').height('100%')
        }.tabBar(this.tabBuilder(5, 'g2'))
        TabContent() {
          Column({ space: 2 }) {
            WaterFlow() {
              LazyForEach(this.dataSource, (item: number) => {
                FlowItem() {
                  Column() {
                    Text("N" + item).fontSize(12).height('16')
                    Image('res/waterFlowTest(' + item % 5 + ').jpg')
                  }
                }.margin({bottom:100})
                .width('100%')
                .height(this.itemHeightArray[item % 100])
                .backgroundColor(this.colors[item % 5])
              }, (item: string) => item)
            }
            .columnsTemplate('repeat(auto-fill,80)')
            .columnsGap(10)
            .rowsGap(30)
            .padding({left:5})
            .backgroundColor(0xFAEEE0)
            .edgeEffect(EdgeEffect.Spring)
          }.width('100%').height('100%')
        }.tabBar(this.tabBuilder(6, 'w1'))
        TabContent() {
          Column({ space: 2 }) {
            WaterFlow() {
              LazyForEach(this.dataSource, (item: number) => {
                FlowItem() {
                  Column() {
                    Text("N" + item).fontSize(12).height('16')
                    Image('res/waterFlowTest(' + item % 5 + ').jpg')
                  }
                }.margin({top:100})
                .width('100%')
                .height(this.itemHeightArray[item % 100])
                .backgroundColor(this.colors[item % 5])
              }, (item: string) => item)
            }
            .columnsTemplate('repeat(auto-fill,80)')
            .columnsGap(10)
            .rowsGap(30)
            .padding({left:5})
            .backgroundColor(0xFAEEE0)
            .edgeEffect(EdgeEffect.Spring)
          }.width('100%').height('100%')
        }.tabBar(this.tabBuilder(7, 'w2'))
      }
      .vertical(this.VerticalAttr === 'true'? true : false)
      .scrollable(this.ScrollableAttr === 'true'? true : false)
      .barMode(this.getBarMode(),this.getScrollableBarModeOptions())
      .barWidth(this.getBarWidth())
      .barHeight(this.getBarHeight())
      .animationDuration(this.getAnimationDuration())
      .animationMode(this.getAnimationMode())
      .divider(this.getDivider())
      .fadingEdge(this.FadingEdgeAttr)
      .barOverlap(this.BarOverlapAttr)
      .barBackgroundColor(this.BarBackgroundColorAttr)
      .barBackgroundBlurStyle(this.getBarBackgroundBlurStyle())
      .barGridAlign(this.getBarGridAlign())
      .edgeEffect(this.getEdgeEffect())
      .onChange((index: number) => {
        // currentIndex controls which tab is displayed.
        this.currentIndex = index
      })
      .onAnimationStart((index: number, targetIndex: number, event: TabsAnimationEvent) => {
        if (index === targetIndex) {
          return
        }
        // selectedIndex controls the color switching for the image and text in the custom tab bar.
        this.selectedIndex = targetIndex
      })
      .width('90%')
      .height('90%')
      .margin({ top: 52 })
     // .backgroundColor('#F1F3F5')
      Button("Back")
        .onClick(() => {
          router.back()
          //     router.replaceUrl({ url: "pages/Index"})
        })
    }
    .height('100%')
    .width('100%')
  }
}