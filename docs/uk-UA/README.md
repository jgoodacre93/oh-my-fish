<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="192px" height="192px"/>
<img align="left" width="0" height="192px" hspace="10"/>

> The <a href="http://fishshell.com">Fishshell</a> Framework

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE) [![Fish Shell Version](https://img.shields.io/badge/fish-≥v3.0.0-007EC7.svg?style=flat-square)](http://fishshell.com) [![Travis Build Status](http://img.shields.io/travis/oh-my-fish/oh-my-fish.svg?style=flat-square)](https://travis-ci.org/oh-my-fish/oh-my-fish) [![Slack Status](https://oh-my-fish-slack.herokuapp.com/badge.svg)](https://oh-my-fish-slack.herokuapp.com)

Oh My Fish надає базову інфраструктуру, щоб забезпечити встановлення пакетів які розширюють та модифікують зовнішній вигляд вашої оболонки. Він швидкий, розширюваний та легкий у використанні.

> Also in&nbsp;
> <a href="../../README.md">🇺🇸</a>
> <a href="../es-ES/README.md">🇪🇸</a>
> <a href="../nl-NL/README.md">🇳🇱</a>
> <a href="../pt-BR/README.md">🇧🇷</a>
> <a href="../ru-RU/README.md">🇷🇺</a>
> <a href="../zh-CN/README.md">🇨🇳</a>

<br>

# Встановлення

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf help
```

Або _завантажте_ та запустіть власноруч:

```fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install > install
fish install
```

# Туторіал

Oh My Fish містить невелику утиліту `omf` для завантаження та встановлення нових пакетів та тем.

#### `omf update`

Оновлює фреймворк та встановлені пакети.

#### `omf install` _`[<name>|<url>]`_

Встановлює один _або більше_ пакетів.

- Ви можете встановити пакети по URL за допомогою команди `omf install URL`
- Коли викликається без аргументів, встановлює відсутні пакети із [bundle](#Файли-конфігурації).

#### `omf list`

Список встановлених пакетів.

#### `omf theme` _`<theme>`_

Задіює тему. Для того щоб отримати список доступних тем, виконайте `omf theme`. Також ви можете попередньо проглянути усі [доступні теми](../Themes.md) перед встановленням.

#### `omf remove` _`<name>`_

Видаляє тему або пакет.

> Пакети, підписані на події `uninstall_<pkg>`, повідомлюються перед тим, як пакет буде видалено, завдяки цьому може бути реалізоване кастомне очищення ресурсів. Читайте детальніше про [видалення](Packages.md#Видалення) пакетів в Oh My Fish.

#### `omf new pkg | theme` _`<name>`_

Генерує новий пакет чи тему.

> Створює нову директорію у `$OMF_CONFIG/{pkg | themes}/` із шаблоном.

#### `omf submit` _`pkg/<name>`_ _`[<url>]`_

Додає новий пакет. Щоб додати тему, використовуйте `omf submit` _`themes/<name>`_ _`<url>`_.

Переконайтесь що [надіслали нам PR][omf-pulls-link], щоб оновити реєстр.

#### `omf doctor`

Використовуйте для усунення проблем перед [створенням нового issue][omf-issues-new].

#### `omf destroy`

Видаляє Oh My Fish.

# Для досвідчених

Встановлювач Oh My Fish поміщає код для старта у вашому файлі конфігурації (`~/.config/fish/config.fish`).

## Стартап

Кожного разу, кколи ви відкриваєте новий shell, стартап код ініціалізує Oh My Fish шлях встановлення і _конфіг_ шлях (`~/.config/omf` за замовчуванням), потім запускає [`init.fish`](../../init.fish) скрипт, який автоматично завантажує пакети, теми та ваші кастомні init файли. Із деталями можна ознайомитися у [FAQ](FAQ.md#Що саме робить Oh My Fish?).

## Файли конфігурації

Каталог `$OMF_CONFIG` надає стан користувача Oh My Fish, і це чудовий кандидат для додаваняня у ваші dotfiles і/або в систему контролю версій. Тут міститься чотири важливих файли:

- __`theme`__ - Поточна тема
- __`bundle`__ - Список встановлених пакетів/тем
- __`init.fish`__ - Кастомний скрипт, що запускається після запуску shell
- __`before.init.fish`__ - Кастомний скрипт, що запускається перед запуском shell

Наполеглево рекомендується додавати свої стартап команди у файл `init.fish` замість `~/.config/fish/config.fish`, так как як це дозволяє вам тримати весь каталог `$OMF_CONFIG` в системі контролю версій.

Якщо вам потрібно запускати стартап команди *перед* тим, як Oh My Fish почне завантажувати плагіни, помістіть їх в `before.init.fish`. Якщо ви не впевнені, як правило, краще помістити їх в `init.fish`.

### Про `bundle`

Кожного разу, коли пакет/тема встановлюється чи видаляється, `bundle` файл оновлюється. Також ви можете відредагувати його і поітм запустити `omf install` щоб зафіксувати зміни. Будь ласка, зверніть увагу: якщо пакети/теми додані в `bundle`, вони автоматично встановлюються, в той час як пакети/теми, видалені із `bundle` файлу, не видаляються із користувацької папки.

## Створення пакетів

Oh My Fish використовує сучасну та добре виділену архітектуру плагінів для спрощення їх розробки, включаючи події ініціалізації/видалення та функції автозавантаження.

[Дивіться документацію](Packages.md), щоб дізнатися детальніше.

[fishshell]: http://fishshell.com

[contributors]: https://github.com/oh-my-fish/oh-my-fish/graphs/contributors

[omf-pulls-link]: https://github.com/oh-my-fish/oh-my-fish/pulls

[omf-issues-new]: https://github.com/oh-my-fish/oh-my-fish/issues/new
