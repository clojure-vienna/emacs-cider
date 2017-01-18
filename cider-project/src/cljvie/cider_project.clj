(ns cljvie.cider-project
  (:require [clojure.tools.nrepl.server :refer [start-server default-handler]]
            [cider.nrepl :refer [cider-middleware]]
            [clojure.pprint :refer [pprint]]))

(defn pprint-str [o]
  (with-out-str (pprint o)))

(defn cljvie-middleware [handler]
  (fn [req]
    (let [resp (handler req)]
      (.println System/out (str "REQUEST " (pprint-str req) \newline
                                " => " (pprint-str resp)))
      resp)))

(defn -main [port-s]
  (start-server
   :port (Long/parseLong port-s)
   :handler (apply default-handler (cons #'cljvie-middleware
                                         (map resolve cider-middleware))))
  (println "Started nrepl server on" port-s))
