vim.api.nvim_create_user_command("Bridge", function() 
    print("Bridge starting...")
    local ns = vim.fn.input "namespace: "
    local service = vim.fn.input "service: "
    local port = vim.fn.input "port: "
    local cmd = interp("dsc connect --service ${service} --local-port ${port} --namespace ${namespace} -y", {service = service, port = port, namespace = ns})
    print(cmd)
    vim.fn.termopen(cmd,{rpc= 'true', detech='true', on_stdout =function(j, d, e) 
        output = output .. vim.fn.join(d)
    end,
  })
end, {})

function interp(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end
