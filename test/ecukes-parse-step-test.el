(require 'ecukes-parse)

(ert-deftest parse-step-mix-regular-py-string-table ()
  "Should parse a mix of steps in order: regular, py-string, table."
  (with-parse-scenario
   "mix-regular-py-string-table"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal head "Given"))
         (should (equal body "a known state"))
         (should (equal type 'regular))
         (should (equal args nil))
         (should (equal arg nil)))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal head "Given"))
         (should (equal body "this text:"))
         (should (equal type 'py-string))
         (should (equal args nil))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal head "Given"))
         (should (equal body "these meals:"))
         (should (equal type 'table))
         (should (equal args nil))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))))))

(ert-deftest parse-step-mix-py-string-table-regular ()
  "Should parse a mix of steps in order: py-string, table, regular."
  (with-parse-scenario
   "mix-py-string-table-regular"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal head "Given"))
         (should (equal body "this text:"))
         (should (equal type 'py-string))
         (should (equal args nil))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal head "Given"))
         (should (equal body "these meals:"))
         (should (equal type 'table))
         (should (equal args nil))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (body (ecukes-step-body step))
              (head (ecukes-step-head step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal head "Given"))
         (should (equal body "a known state"))
         (should (equal type 'regular))
         (should (equal args nil))
         (should (equal arg nil)))))))

(ert-deftest parse-step-mix-table-regular-py-string ()
  "Should parse a mix of steps in order: table, regular, py-string."
  (with-parse-scenario
   "mix-table-regular-py-string"
   (lambda (scenario name step-names tags)
     (let ((steps (ecukes-scenario-steps scenario)))
       (let* ((step (nth 0 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given these meals:"))
         (should (equal head "Given"))
         (should (equal body "these meals:"))
         (should (equal type 'table))
         (should (equal args nil))
         (should (equal arg '(("meal" "price") ("Hamburger" "$4.50")))))
       (let* ((step (nth 1 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given a known state"))
         (should (equal head "Given"))
         (should (equal body "a known state"))
         (should (equal type 'regular))
         (should (equal args nil))
         (should (equal arg nil)))
       (let* ((step (nth 2 steps))
              (name (ecukes-step-name step))
              (head (ecukes-step-head step))
              (body (ecukes-step-body step))
              (type (ecukes-step-type step))
              (args (ecukes-step-args step))
              (arg (ecukes-step-arg step)))
         (should (equal name "Given this text:"))
         (should (equal head "Given"))
         (should (equal body "this text:"))
         (should (equal type 'py-string))
         (should (equal args nil))
         (should (equal arg "Lorem ipsum dolor sit amet.\nCurabitur pellentesque iaculis eros.")))))))

(ert-deftest parse-step-single-args ()
  "Should parse single args."
  (with-parse-step
   "single-args"
   (lambda (name head body type args arg)
     (should
      (equal args (list "known"))))))

(ert-deftest parse-step-multiple-args ()
  "Should parse multiple args."
  (with-parse-step
   "multiple-args"
   (lambda (name head body type args arg)
     (should
      (equal args (list "known" "unknown"))))))
