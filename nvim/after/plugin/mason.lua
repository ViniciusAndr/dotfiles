local status, mason = pcall(require, "mason")
if (not status) then
  print("Mason is not installed")
  return
end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then
  print("Mason-LSP Config is not installed")
  return
end


mason.setup({
})

mason_lspconfig.setup({
  ensure_installed = {
    'lua_ls',
    'tsserver',
    'graphql',
    'rust_analyzer',
    'tailwindcss',
    'cssls',
  },
  automatic_installation = true,
})
