import applescript


# Call the run handler and user-defined handlers with/without arguments
scpt = applescript.AppleScript('''
  on run {arg1, arg2}
    tell app "Finder" to display dialog arg2 & " " & arg1
  end run

  on foo()
    return "foobar"
  end foo

  on Bar(x, y)
    return x * y
  end Bar
''')

# Run each of the handlers and print the results
print(scpt.run('Python','Calling'))
print(scpt.call('foo'))
print(scpt.call('Bar', 3, 5))