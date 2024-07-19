local function get_lines_from_buffer()
  -- Get the current buffer number
  local buf = vim.api.nvim_get_current_buf()

  -- Get lines from the buffer
  return vim.api.nvim_buf_get_lines(buf, 0, -1, false)
end

function set_arglist_from_buffer()
  local lines = get_lines_from_buffer()
  local filenames = {}
  local unique_filenames = {}

  for _, line in ipairs(lines) do
    local filename = line:match("([^|]+)")
    if filename and not filenames[filename] then
      filenames[filename] = true
      table.insert(unique_filenames, filename)
    end
  end

  local arglist = table.concat(unique_filenames, " ")
  vim.cmd("args " .. arglist)
end

local function run_cmd_on_buffers(cmd)
  set_arglist_from_buffer()
  -- receive command and apply with argdo
  vim.cmd("argdo " .. cmd)
end

function run_cmd_on_buffers_with_input()
  local cmd = vim.fn.input('Enter command for argdo: ')
  if cmd and cmd ~= '' then
    run_cmd_on_buffers(cmd)
  else
    print('No command entered.')
  end
end
