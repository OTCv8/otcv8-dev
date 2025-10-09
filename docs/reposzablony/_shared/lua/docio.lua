-- docio.lua
-- Shared IO utilities for documentation extraction
-- UTF-8 safe, LF line endings, rotation support

local docio = {}

-- Maximum file size before rotation (50MB)
docio.MAX_BYTES = 50 * 1024 * 1024

-- Write content to file (UTF-8, LF)
function docio.writeAll(path, content)
    local f = io.open(path, 'wb')
    if not f then
        error('Cannot open file for writing: ' .. path)
    end
    
    -- Ensure LF line endings
    content = content:gsub('\r\n', '\n')
    
    f:write(content)
    f:close()
end

-- Read entire file
function docio.readAll(path)
    local f = io.open(path, 'rb')
    if not f then
        return nil
    end
    
    local content = f:read('*all')
    f:close()
    
    return content
end

-- Append to file
function docio.append(path, content)
    local f = io.open(path, 'ab')
    if not f then
        error('Cannot open file for appending: ' .. path)
    end
    
    content = content:gsub('\r\n', '\n')
    f:write(content)
    f:close()
end

-- Check if file needs rotation
function docio.needsRotation(path)
    local f = io.open(path, 'rb')
    if not f then
        return false
    end
    
    local size = f:seek('end')
    f:close()
    
    return size >= docio.MAX_BYTES
end

-- Rotate file (rename to timestamped version)
function docio.rotate(path)
    local timestamp = os.date('%Y%m%d-%H%M')
    local dir = path:match('(.+)/[^/]+$') or '.'
    local base = path:match('([^/]+)$')
    local name, ext = base:match('(.+)%.(.+)$')
    
    if not name then
        name = base
        ext = ''
    end
    
    local chunkDir = dir .. '/chunks'
    
    -- Create chunks directory if it doesn't exist
    os.execute('mkdir -p "' .. chunkDir .. '"')
    
    local newPath = chunkDir .. '/' .. name .. '.' .. timestamp .. '.' .. ext
    
    -- Rename
    os.rename(path, newPath)
    
    return newPath
end

-- Write CSV with rotation support
function docio.writeCSV(path, headers, rows)
    -- Check if rotation needed
    if docio.needsRotation(path) then
        docio.rotate(path)
    end
    
    -- Write CSV
    local lines = {}
    table.insert(lines, table.concat(headers, ','))
    
    for _, row in ipairs(rows) do
        local values = {}
        for _, header in ipairs(headers) do
            local value = tostring(row[header] or '')
            -- Escape commas and quotes
            if value:find('[,"]') then
                value = '"' .. value:gsub('"', '""') .. '"'
            end
            table.insert(values, value)
        end
        table.insert(lines, table.concat(values, ','))
    end
    
    docio.writeAll(path, table.concat(lines, '\n') .. '\n')
end

-- Write NDJSON with rotation support
function docio.writeNDJSON(path, records)
    -- Check if rotation needed
    if docio.needsRotation(path) then
        docio.rotate(path)
    end
    
    -- Write NDJSON
    local lines = {}
    for _, record in ipairs(records) do
        -- Assume json encode function exists
        local json = require('json')
        table.insert(lines, json.encode(record))
    end
    
    docio.writeAll(path, table.concat(lines, '\n') .. '\n')
end

-- ISO timestamp
function docio.isoTimestamp()
    local t = os.date('!*t')
    return string.format('%04d-%02d-%02dT%02d:%02d:%02dZ',
        t.year, t.month, t.day, t.hour, t.min, t.sec)
end

return docio
