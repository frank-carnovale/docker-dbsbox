FROM wnameless/postgresql-phppgadmin

COPY dbsbox.sh /etc/profile.d
COPY test_*.sql /sql/

COPY builder.sh /
RUN /builder.sh

# as postgres without default envvars: start db, create test user and an empty test db
# as postgres with    default envvars: populate test data into new default db
# as root                            : start apache, start sshd
CMD service postgresql start                    &&   \
    su   postgres -c 'psql </sql/test_user.sql' &&   \
    su - postgres -c 'psql </sql/test_data.sql' ;    \
    service apache2 start                       ;    \
    /usr/sbin/sshd -D

