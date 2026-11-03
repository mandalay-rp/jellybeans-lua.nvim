-- colors/jellybeans.lua

-- 1. Пытаемся загрузить основной модуль
local ok, jellybeans = pcall(require, "jellybeans")

-- 2. Если не удалось, возможно, плагин лежит в директории 'opt' и его
-- путь к Lua-модулям еще не добавлен в runtimepath.
if not ok then
  -- Явно загружаем плагин (поддерживаем оба возможных имени директории)
  vim.cmd("silent! packadd jellybeans-lua.nvim")
  vim.cmd("silent! packadd jellybeans.nvim")

  -- Повторяем попытку загрузки модуля
  ok, jellybeans = pcall(require, "jellybeans")

  if not ok then
    vim.notify(
      "jellybeans: Не удалось загрузить модуль. Проверьте правильность установки плагина.",
      vim.log.levels.ERROR
    )
    return
  end
end

-- 3. Запускаем применение цветовой схемы
jellybeans.load()
