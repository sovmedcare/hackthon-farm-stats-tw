# Farm Stats TW (台灣果菜市場價格查詢)

利用 elm, elm-native-ui (react-native) 製作台灣果菜市場價格查詢

## Setup

```js
git clone https://github.com/sovmedcare/hackthon-farm-stats-tw
yarn install
```

## Development

```js
// for dev (recompile elm)
yarn watch
// for running bundle on mobile simulator
yarn start
// for running web
elm-reactor
```

## 過程中可能會發生的問題

Q: 重新 elm-package install 發生錯誤？  
A: 因為 elm-native-ui 不在 elm index 中, 所以必須另外安裝  

  at current DIR
  1. remove elm-staff
  1. remove line of elm-native-ui in ```elm-package.json```
  1. elm-package install

  at parent DIR
  1. git clone https://github.com/ohanhi/elm-native-ui
  1. git clone https://github.com/NoRedInk/elm-ops-tooling
  1. ```python elm-ops-tooling/elm_self_publish.py ./elm-native-ui ./hackthon-farm-stats-tw```

Q: Xcode 出現 compile error (React/RCTBridge.h)  
A: Product -> Scheme -> Manage Scheme -> Debug -> Build  

  1. uncheck Parallelize Build
  1. click "+" -> Add React
  1. move React to the top order

### iOS preview
![](https://i.imgur.com/0jpagTg.png)

### web preview
![](https://i.imgur.com/E2SdXxS.png)
