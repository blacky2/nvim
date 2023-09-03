--
--
-- wiki
--

local plugin = {}

function plugin.init()
  -- base wiki
  local wiki_base = {
    ['automatic_nested_syntaxes'] = 1,
    ['nested_syntaxes'] = { ['python'] = 'python', ['c++'] = 'cpp' },
    ['path'] = '~/wiki/wiki/md',
    ['path_html'] = '~/wiki/wiki/html',
    ['syntax'] = 'markdown',
    ['ext'] = '.md',
    ['template_path'] = '~/wiki/wiki/templates',
    ['template_default'] = 'template',
    ['tempalte_ext'] = '.html',
  }
  vim.g.vimwiki_list = { wiki_base }
end

return plugin
