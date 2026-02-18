# NewsStreamApp

## Описание приложения

NewsStreamApp — это iOS-приложение для просмотра актуальных новостей. Приложение отображает подборку топ-новостей и ленты с карточками статей, поддерживает переход на детальный экран, загрузку изображений с плейсхолдерами и обновление контента жестом pull-to-refresh.

## Скриншоты и демо-видео

### Скрины

<div style="display: flex; gap: 10px;">
    <img width="150" alt="home-view-light" src="/Resources/Screenshots/home-view-light.png" />
    <img width="150" alt="detail-screen-light" src="/Resources/Screenshots/detail-screen-light.png" />
    <img width="150" alt="home-view-dark" src="/Resources/Screenshots/home-view-dark.png" />
    <img width="150" alt="detail-screen-dark" src="/Resources/Screenshots/detail-screen-dark.png" />
</div>

### Демо

  <img width="210" alt="Демонстрация приложения" src="/Resources/Video/NewsStreamAppDemo.gif">

## Назначение и цели приложения

• Предоставлять пользователю быстрый доступ к свежим новостям в удобном карточном интерфейсе.

• Обеспечить плавную загрузку изображений с аккуратными плейсхолдерами и эффектом параллакса на детальном экране.

• Дать возможность быстро обновлять контент и переходить к полному описанию статьи.

## Технологический стек

• Swift 6 / Xcode 26

• SwiftUI (навигация, верстка, анимации, AsyncImage)

• Concurrency (async/await при загрузке данных)

• URLSession / сетевой слой (для получения новостей)

• Архитектура: MVVM (View + ViewModel + Model)

