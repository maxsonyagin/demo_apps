import router from '@ohos.router'

export interface DataClass {
  title: string
  page: string
}

@Entry
@Component
struct Index {
  data: DataClass[] = [
    {
      title: 'Icon',
      page: 'pages/Icon'
    },
    {
      title: 'Arrow',
      page: 'pages/Arrow'
    },
    {
      title: 'Button',
      page: 'pages/Button'
    },
    {
      title: 'Checkbox',
      page: 'pages/Checkbox'
    },
    {
      title: 'Radio',
      page: 'pages/Radio'
    },
    {
      title: 'Image',
      page: 'pages/Image'
    },
    {
      title: 'Text',
      page: 'pages/Text'
    },
  ]

  build() {
    Stack() {
      List({ space: '8vp' }) {
        ForEach(this.data, (item: DataClass) => {
          ListItem() {
            Button(item.title)
              .width('100%')
              .onClick(() => {
                router.pushUrl({ url: item.page })
              })
          }
          .width('100%')
          .padding({ left: '8vp', right: '8vp' })
        }, (item: DataClass) => item.title)
      }.scrollBar(BarState.Off)
    }
    .height('100%')
    .width('100%')
  }
}