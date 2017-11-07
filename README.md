# Farm Stats TW (台灣果菜市場價格查詢)

利用 elm, elm-native-ui (react-native) 製作台灣果菜市場價格查詢

## Setup

```js
git clone https://github.com/sovmedcare/hackthon-farm-stats-tw
yarn install
elm-package install
```

## Development

```js
// for dev (recompile elm)
yarn watch
// for running bundle on mobile simulator
yarn start
```

## 過程中可能會發生的問題

Q: elm-native-ui 無法安裝？
A: 因為 elm-native-ui 不在 elm index 中, 所以必須另外安裝

  1. 先移除 elm-package.json 的 elm-native-ui
  1. 在上層資料夾 ```git clone https://github.com/ohanhi/elm-native-ui```
  1. 利用 https://github.com/NoRedInk/elm-ops-tooling#elm_self_publish
     ```python path/to/elm_self_publish.py ./elm-native-ui ./MyAppName```
     把 elm-native-ui module 搬進去

Q: Xcode 出現 compile error
A: Product -> Scheme -> Manage Scheme -> Debug -> Build

   1. uncheck Parallelize Build
   1. 點 "+" -> Add React
   1. move React to the top
