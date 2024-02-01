(defn quick-sort [[pivot & coll]]
  (when pivot
    (let [{lesser false greater true} (group-by #(> % pivot) coll)]
      (lazy-cat (quick-sort lesser)
                [pivot]
                (quick-sort greater)))))
